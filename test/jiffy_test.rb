$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'stringio'
require 'minitest/autorun'
require 'jiffy'

valid_json = '["Valid JSON"]'
invalid_json = '["Invalid" "JSON"]'
incomplete_json = '["Incomplete JSON'

def it_should_properly_handle(exception, options)
  io = Object.new.tap do |io|
    io.define_singleton_method :readpartial do |*|
      raise exception
    end
  end

  it "should return false upon #{exception.inspect}" do
    assert_equal false, Jiffy.new(in: io, out: StringIO.new).cl_format(err: StringIO.new)
  end

  it "should write #{options[:with]} to :stderr upon #{exception.inspect}" do
    err = StringIO.new

    Jiffy.new(in: io, out: StringIO.new).cl_format(err: err)

    assert_includes err.string, options[:with]
  end

  it ":stderr should end with a newline upon #{exception.inspect}" do
    err = StringIO.new

    Jiffy.new(in: io, out: StringIO.new).cl_format(err: err)

    assert_equal "\n", err.string[-1]
  end
end

describe Jiffy do
  positive_examples = Dir[File.join(File.dirname(__FILE__), 'positive-examples', '*')]

  describe '#format' do
    positive_examples.each do |example|
      it "should format #{File.basename(example)} without raising an exception" do
        out = StringIO.new

        Jiffy.new(in: example, out: out).format

        assert_equal(out.string, File.read(example).strip)
      end
    end

    negative_examples = Dir[File.join(File.dirname(__FILE__), 'negative-examples', '*')]

    negative_examples.each do |example|
      it "should raise an exception when formatting #{File.basename(example)}" do
        out = StringIO.new

        assert_raises Jiffy::UnexpectedEndError, Jiffy::UnparseableError do
          Jiffy.new(in: example, out: out).format
        end
      end
    end

    it 'should raise UnexpectedEndError on valid, but incomplete JSON input' do
      example = StringIO.new incomplete_json

      assert_raises Jiffy::UnexpectedEndError do
        Jiffy.new(in: example, out: StringIO.new).format
      end
    end

    it 'should raise UnexpectedEndError on empty input' do
      example = StringIO.new ""

      assert_raises Jiffy::UnexpectedEndError do
        Jiffy.new(in: example, out: StringIO.new).format
      end
    end

    it 'should raise UnparseableError on invalid JSON input' do
      example = StringIO.new invalid_json

      assert_raises Jiffy::UnparseableError do
        Jiffy.new(in: example, out: StringIO.new).format
      end
    end
  end

  describe '#initialize' do
    it 'should raise an error when :in is neither an instance of Strirng nor IO' do
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

      assert_equal true, Jiffy.new(in: example, out: StringIO.new).cl_format
    end

    it 'should not write to :stderr upon valid input' do
      example = StringIO.new valid_json

      err = StringIO.new

      Jiffy.new(in: example, out: StringIO.new).cl_format(err: err)

      assert_equal "", err.string
    end

    it ':stdout should end with a newline upon valid input' do
      example = StringIO.new valid_json

      out = StringIO.new

      Jiffy.new(in: example, out: out).cl_format

      assert_equal "\n", out.string[-1]
    end
  end
end
