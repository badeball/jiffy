require 'stringio'
require 'minitest/autorun'
require 'jiffy'

valid_json = '["Valid JSON"]'
invalid_json = '["Invalid" "JSON"]'
incomplete_json = '["Incomplete JSON'

class DummyOutputter
  def process_token(*); end
end

def it_should_properly_handle(exception, options)
  io = Object.new.tap do |io|
    io.define_singleton_method :readpartial do |*|
      raise exception
    end
  end

  it "should return false upon #{exception.inspect}" do
    assert_equal false, Jiffy.new(in: io).cl_format(err: StringIO.new, outputter: DummyOutputter.new)
  end

  it "should write #{options[:with]} to :stderr upon #{exception.inspect}" do
    err = StringIO.new

    Jiffy.new(in: io).cl_format(err: err, outputter: DummyOutputter.new)

    assert_includes err.string, options[:with]
  end

  it ":stderr should end with a newline upon #{exception.inspect}" do
    err = StringIO.new

    Jiffy.new(in: io).cl_format(err: err, outputter: DummyOutputter.new)

    assert_equal "\n", err.string[-1]
  end
end

def it_should_tokenize(json)
  it "should tokenize #{json.inspect}" do
    begin
      Jiffy.new(in: StringIO.new(json)).tokenize.to_a
    rescue Jiffy::UnexpectedEndError, Jiffy::UnparseableError
      raise "should have tokenized #{json.inspect}, but didn't"
    end
  end
end

def it_should_not_tokenize(json)
  it "should not tokenize #{json.inspect}" do
    assert_raises Jiffy::UnexpectedEndError, Jiffy::UnparseableError do
      Jiffy.new(in: StringIO.new(json)).tokenize.to_a
    end
  end
end

describe Jiffy do
  describe '#tokenize' do
    it_should_tokenize '{}'
    it_should_tokenize '{"":{}}'
    it_should_tokenize '{"":"","":""}'
    it_should_tokenize '[]'
    it_should_tokenize '[[]]'
    it_should_tokenize '[{}]'
    it_should_tokenize '{"":[]}'
    it_should_tokenize '["",""]'
    it_should_tokenize '[false]'
    it_should_tokenize '[true]'
    it_should_tokenize '[null]'
    it_should_tokenize '["foo"]'
    it_should_tokenize '["\b"]'
    it_should_tokenize '["\r"]'
    it_should_tokenize '["\f"]'
    it_should_tokenize '["\t"]'
    it_should_tokenize '["\n"]'
    it_should_tokenize '["\""]'
    it_should_tokenize '["\\\\"]'
    it_should_tokenize '["\/"]'
    it_should_tokenize '["\u1111"]'
    it_should_tokenize '[100]'
    it_should_tokenize '[100e10]'
    it_should_tokenize '[100E10]'
    it_should_tokenize '[100e-10]'
    it_should_tokenize '[100E-10]'
    it_should_tokenize '[1.123]'
    it_should_tokenize '[1.123e10]'
    it_should_tokenize '[1.123E10]'
    it_should_tokenize '[1.123e-10]'
    it_should_tokenize '[1.123E-10]'
    it_should_tokenize '[-100]'
    it_should_tokenize '[-100e10]'
    it_should_tokenize '[-100E10]'
    it_should_tokenize '[-100e-10]'
    it_should_tokenize '[-100E-10]'
    it_should_tokenize '[-1.123]'
    it_should_tokenize '[-1.123e10]'
    it_should_tokenize '[-1.123E10]'
    it_should_tokenize '[-1.123e-10]'
    it_should_tokenize '[-1.123E-10]'

    it_should_not_tokenize '[0x00]'
    it_should_not_tokenize '[Infinity]'
    it_should_not_tokenize '[,""]'
    it_should_not_tokenize '["",]'
    it_should_not_tokenize '[01]'
    it_should_not_tokenize "[\"line\nbreak\"]"
    it_should_not_tokenize '{"" ""}'
    it_should_not_tokenize '[NaN]'
    it_should_not_tokenize '[+1.123]'
    it_should_not_tokenize '[+100]'
    it_should_not_tokenize "['single quoted string']"
    it_should_not_tokenize "[\"tab\tcharacter\"]"
    it_should_not_tokenize '{"":"",}'
    it_should_not_tokenize 'true'
    it_should_not_tokenize '""'
    it_should_not_tokenize '[true'
    it_should_not_tokenize '{"":""'

    it 'should raise UnexpectedEndError on valid, but incomplete JSON input' do
      example = StringIO.new incomplete_json

      assert_raises Jiffy::UnexpectedEndError do
        Jiffy.new(in: example).tokenize.to_a
      end
    end

    it 'should raise UnexpectedEndError on empty input' do
      example = StringIO.new ""

      assert_raises Jiffy::UnexpectedEndError do
        Jiffy.new(in: example).tokenize.to_a
      end
    end

    it 'should raise UnparseableError on invalid JSON input' do
      example = StringIO.new invalid_json

      assert_raises Jiffy::UnparseableError do
        Jiffy.new(in: example).tokenize.to_a
      end
    end
  end

  describe '#initialize' do
    it 'should not raise an error when :in is an instance of String' do
      Jiffy.new(in: __FILE__)
    end

    it 'should not raise en error when :in responds to :readpartial' do
      class Bar
        def readpartial(*); end
      end

      Jiffy.new(in: Bar.new)
    end

    it 'should raise an error when :in is neither an instance of Strirng nor responds to :readpartial' do
      class Foo; end

      assert_raises ArgumentError do
        Jiffy.new(in: Foo.new)
      end
    end
  end

  describe '#cl_format' do
    it_should_properly_handle Jiffy::UnexpectedEndError.new('Unexpected end of input'), with: 'Unexpected end of input'
    it_should_properly_handle Jiffy::UnparseableError.new('Unexpected token at position'), with: 'Unexpected token at position'
    it_should_properly_handle Errno::EACCES, with: 'jiffy: Permission denied'
    it_should_properly_handle Errno::ENOENT, with: 'jiffy: No such file or directory'
    it_should_properly_handle Errno::EISDIR, with: 'jiffy: Is a directory'

    it 'should return true upon valid input' do
      example = StringIO.new valid_json

      assert_equal true, Jiffy.new(in: example).cl_format(outputter: DummyOutputter.new)
    end

    it 'should not write to :stderr upon valid input' do
      example = StringIO.new valid_json

      err = StringIO.new

      Jiffy.new(in: example).cl_format(err: err, outputter: DummyOutputter.new)

      assert_equal "", err.string
    end

    it ':stdout should end with a newline upon valid input' do
      example = StringIO.new valid_json

      out = StringIO.new

      Jiffy.new(in: example).cl_format(outputter: Jiffy::JsonOutputter.new(out: out))

      assert_equal "\n", out.string[-1]
    end
  end
end
