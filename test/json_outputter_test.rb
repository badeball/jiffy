$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'minitest/autorun'
require 'json_better_formatter/json_outputter'

describe JsonBetterFormatter::JsonOutputter do
  describe '#initialize' do
    it 'should raise an error when :out does not respond to #print' do
      out = Object.new

      def out.respond_to?(method)
        if method == :print
          false
        else
          super
        end
      end

      assert_raises RuntimeError do
        JsonBetterFormatter::JsonOutputter.new out: out
      end
    end
  end
end
