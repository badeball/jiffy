$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'stringio'
require 'minitest/autorun'
require 'jiffy'

describe Jiffy do
  positive_examples = Dir[File.join(File.dirname(__FILE__), 'positive-examples', '*')]

  positive_examples.each do |example|
    it "should correctly format #{File.basename(example)}" do
      out = StringIO.new

      Jiffy.new(in: example, out: out).format

      assert_equal(out.string, File.read(example).strip)
    end
  end

  negative_examples = Dir[File.join(File.dirname(__FILE__), 'negative-examples', '*')]

  negative_examples.each do |example|
    it "should not format #{File.basename(example)}" do
      out = StringIO.new

      expected_exception = if /unclosed/ =~ example
                             Jiffy::UnexpectedEndError
                           else
                             Jiffy::UnparseableError
                           end

      assert_raises expected_exception do
        Jiffy.new(in: example, out: out).format
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
