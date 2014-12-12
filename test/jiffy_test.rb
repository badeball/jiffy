$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'stringio'
require 'minitest/autorun'
require 'jiffy'

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
      example = StringIO.new <<-JSON.strip
        ["Incomplete JSON
      JSON

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
      example = StringIO.new <<-JSON.strip
        ["Invalid" "JSON"]
      JSON

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
    it 'should return true upon valid input' do
      example = StringIO.new <<-JSON
        ["Valid JSON"]
      JSON

      assert_equal true, Jiffy.new(in: example, out: StringIO.new).cl_format
    end

    it 'should not write to :stderr upon valid input' do
      example = StringIO.new <<-JSON
        ["Valid JSON"]
      JSON

      err = StringIO.new

      Jiffy.new(in: example, out: StringIO.new).cl_format(err: err)

      assert_equal "", err.string
    end

    it ':stdout should end with a newline upon valid input' do
      example = StringIO.new <<-JSON
        ["Valid JSON"]
      JSON

      out = StringIO.new

      Jiffy.new(in: example, out: out).cl_format

      assert_equal "\n", out.string[-1]
    end

    it 'should return false upon valid, but incomplete input' do
      example = StringIO.new <<-JSON.strip
        ["Incomplete JSON
      JSON

      assert_equal false, Jiffy.new(in: example, out: StringIO.new).cl_format(err: StringIO.new)
    end

    it 'should write "Unexpected end" to :stderr upon valid, but incomplete input' do
      example = StringIO.new <<-JSON.strip
        ["Incomplete JSON
      JSON

      err = StringIO.new

      Jiffy.new(in: example, out: StringIO.new).cl_format(err: err)

      assert_includes err.string, "Unexpected end"
    end

    it ':stderr should end with a newline upon valid, but incomplete input' do
      example = StringIO.new <<-JSON.strip
        ["Incomplete JSON
      JSON

      err = StringIO.new

      Jiffy.new(in: example, out: StringIO.new).cl_format(err: err)

      assert_equal "\n", err.string[-1]
    end

    it 'should return false upon empty input' do
      example = StringIO.new ""

      assert_equal false, Jiffy.new(in: example).cl_format(err: StringIO.new)
    end

    it 'should write "Unexpected end" to :stderr upon empty input' do
      example = StringIO.new ""

      err = StringIO.new

      Jiffy.new(in: example).cl_format(err: err)

      assert_includes err.string, "Unexpected end"
    end

    it ':stderr should end with a newline upon empty input' do
      example = StringIO.new ""

      err = StringIO.new

      Jiffy.new(in: example).cl_format(err: err)

      assert_equal "\n",  err.string[-1]
    end

    it 'should return false upon invalid input' do
      example = StringIO.new <<-JSON
        ["Invalid" "JSON"]
      JSON

      assert_equal false, Jiffy.new(in: example, out: StringIO.new).cl_format(err: StringIO.new)
    end

    it 'should write "Unexpected token" to :stderr upon invalid input' do
      example = StringIO.new <<-JSON
        ["Invalid" "JSON"]
      JSON

      err = StringIO.new

      Jiffy.new(in: example, out: StringIO.new).cl_format(err: err)

      assert_includes err.string, "Unexpected token"
    end

    it ':stderr should end with a newline upon invalid input' do
      example = StringIO.new <<-JSON
        ["Invalid" "JSON"]
      JSON

      err = StringIO.new

      Jiffy.new(in: example, out: StringIO.new).cl_format(err: err)

      assert_equal "\n", err.string[-1]
    end
  end
end
