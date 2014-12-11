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
  end

  describe '#initialize' do
    it 'should raise an error when :in is neither an instance of Strirng nor IO' do
      class Foo; end

      assert_raises ArgumentError do
        Jiffy.new(in: Foo.new)
      end
    end
  end
end
