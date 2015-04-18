require "stringio"
require "minitest/autorun"
require "jiffy/outputter"

def create_test_outputter(options = {})
  options[:out] = StringIO.new

  [options[:out], Jiffy::Outputter.new(options)]
end

describe Jiffy::Outputter do
  describe "::rule" do
    it "should raise an error when specifying both :break_before and :break_after" do
      assert_raises ArgumentError do
        Jiffy::Outputter.rule :foo, break_before: true, break_after: true
      end
    end
  end

  describe "#initialize" do
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
        Jiffy::Outputter.new out: out
      end
    end

    it "should raise an error when :cur_indent is not a Fixnum" do
      assert_raises ArgumentError do
        Jiffy::Outputter.new cur_indent: "not a fixnum"
      end
    end

    it "should raise an error when :indent_size is not a Fixnum" do
      assert_raises ArgumentError do
        Jiffy::Outputter.new indent_size: "not a fixnum"
      end
    end
  end

  describe "#process_token" do
    it "should raise an error when invoked with a token that has no rule" do
      dummy_outputter = Class.new Jiffy::Outputter do
        rule :foo
      end

      assert_raises ArgumentError do
        dummy_outputter.new.process_token :bar
      end
    end
  end

  describe "#apply_rule" do
    describe ":break_before option" do
      it "should create a newline before the payload" do
        out, outputter = create_test_outputter

        outputter.apply_rule break_before: true, payload: "foo"

        assert_equal out.string, "\nfoo"
      end

      it "should respect the value for current indentation and size" do
        out, outputter = create_test_outputter cur_indent: 1, indent_size: 4

        outputter.apply_rule break_before: true, payload: "foo"

        assert_equal out.string, "\n    foo"
      end
    end

    describe ":break_after option" do
      it "should create a newline after the payload" do
        out, outputter = create_test_outputter

        outputter.apply_rule break_after: true, payload: "foo"

        assert_equal out.string, "foo\n"
      end

      it "should respect the value for current indentation and size" do
        out, outputter = create_test_outputter cur_indent: 1, indent_size: 4

        outputter.apply_rule break_after: true, payload: "foo"

        assert_equal out.string, "foo\n    "
      end
    end

    describe ":indent option" do
      it "should change cur_indent" do
        _, outputter = create_test_outputter

        outputter.apply_rule indent: 1

        assert_equal outputter.cur_indent, 1
      end
    end

    describe ":format option" do
      it "should invoke the given callback to format the payload" do
        out, outputter = create_test_outputter

        outputter.apply_rule format: :upcase.to_proc, payload: "foo"

        assert_equal out.string, "FOO"
      end
    end
  end
end
