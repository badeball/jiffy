require "test_helper"
require "stringio"

valid_json = '["Valid JSON"]'

class DummyOutputter
  def process_token(*); end
end

def it_should_properly_handle(exception, options)
  io = Object.new.tap do |io|
    io.define_singleton_method :readpartial do |*|
      raise exception
    end

    io.define_singleton_method :filename do |*|
      "foo"
    end
  end

  it "should return false upon #{exception.inspect}" do
    assert !Jiffy::CL.new(in: io, err: StringIO.new, outputter: DummyOutputter.new).format
  end

  it "should write #{options[:with]} to :stderr upon #{exception.inspect}" do
    err = StringIO.new

    Jiffy::CL.new(in: io, err: err, outputter: DummyOutputter.new).format

    assert_includes err.string, options[:with]
  end

  it ":stderr should end with a newline upon #{exception.inspect}" do
    err = StringIO.new

    Jiffy::CL.new(in: io, err: err, outputter: DummyOutputter.new).format

    assert_equal "\n", err.string[-1]
  end
end

describe Jiffy::CL do
  describe "#format" do
    it_should_properly_handle Jiffy::UnexpectedEndError.new("Unexpected end of input"), with: "Unexpected end of input"
    it_should_properly_handle Jiffy::UnparseableError.new("Unexpected token at position"), with: "Unexpected token at position"
    it_should_properly_handle Errno::EACCES, with: "jiffy: foo: Permission denied"
    it_should_properly_handle Errno::ENOENT, with: "jiffy: foo: No such file or directory"
    it_should_properly_handle Errno::EISDIR, with: "jiffy: foo: Is a directory"

    it "should return true upon valid input" do
      example = StringIO.new valid_json

      assert Jiffy::CL.new(in: example, outputter: DummyOutputter.new).format
    end

    it "should not write to :stderr upon valid input" do
      example = StringIO.new valid_json

      err = StringIO.new

      Jiffy::CL.new(in: example, err: err, outputter: DummyOutputter.new).format

      assert_empty err.string
    end

    it ":stdout should end with a newline upon valid input" do
      example = StringIO.new valid_json

      out = StringIO.new

      Jiffy::CL.new(in: example, outputter: Jiffy::Outputters::Json.new(out: out)).format

      assert_equal "\n", out.string[-1]
    end
  end
end
