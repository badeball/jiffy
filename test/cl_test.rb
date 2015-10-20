require "test_helper"
require "stringio"

valid_json = '["Valid JSON"]'

class DummyOutputter
  def process_token(*); end
end

def test_exception_handling(exception, expected_output)
  jiffy = Object.new.tap do |j|
    j.define_singleton_method :format do
      raise exception
    end
  end

  input = Struct.new("ARGF", :filename).new("foo")

  it "should return false upon #{exception.inspect}" do
    assert !Jiffy::CL.new(in: input, err: StringIO.new, jiffy: jiffy).format
  end

  it "should write #{expected_output} to :stderr upon #{exception.inspect}" do
    err = StringIO.new

    Jiffy::CL.new(in: input, err: err, jiffy: jiffy).format

    assert_includes err.string, expected_output
  end

  it ":stderr should end with a newline upon #{exception.inspect}" do
    err = StringIO.new

    Jiffy::CL.new(in: input, err: err, jiffy: jiffy).format

    assert_equal "\n", err.string[-1]
  end
end

describe Jiffy::CL do
  describe "#format" do
    test_exception_handling Jiffy::UnexpectedEndError, "jiffy: Unexpected end of input"
    test_exception_handling Jiffy::UnparseableError.new(5), "jiffy: Unexpected token at position 5"
    test_exception_handling Errno::EACCES, "jiffy: foo: Permission denied"
    test_exception_handling Errno::ENOENT, "jiffy: foo: No such file or directory"
    test_exception_handling Errno::EISDIR, "jiffy: foo: Is a directory"

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
