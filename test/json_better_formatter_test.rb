$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'stringio'
require 'minitest/autorun'
require 'json_better_formatter'

describe JsonBetterFormatter do
  examples_files = Dir[File.join(File.dirname(__FILE__), 'examples', '*')]

  examples_files.each do |example|
    it "should correctly format #{File.basename(example)}" do
      out = StringIO.new

      JsonBetterFormatter.new(in: example, out: out).format

      assert_equal(out.string, File.read(example).strip)
    end
  end

  describe '#initialize' do
    it 'should raise an error when :in is neither an instance of Strirng nor IO' do
      class Foo; end

      assert_raises RuntimeError do
        JsonBetterFormatter.new(in: Foo.new)
      end
    end
  end
end
