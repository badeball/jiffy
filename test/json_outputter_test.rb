$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'minitest/autorun'
require 'jiffy/json_outputter'

describe Jiffy::JsonOutputter do
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

      assert_raises ArgumentError do
        Jiffy::JsonOutputter.new out: out
      end
    end
  end
end
