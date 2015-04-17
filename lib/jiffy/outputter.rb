class Jiffy
  class Outputter
    class << self
      attr_accessor :rules

      def rule(token, options = {})
        if options[:break_before] && options[:break_after]
          raise ArgumentError, "Cannot specify both :break_before and :break_after"
        end

        @rules ||= {}
        @rules[token] = options
      end
    end

    attr_accessor :out, :cur_indent, :indent_size

    def initialize(options = {})
      @out = options[:out] || $stdout
      @cur_indent = options[:cur_indent] || 0
      @indent_size = options[:indent_size] || 2

      raise ArgumentError, "Invalid output source, must respond to #print" unless @out.respond_to? :print
      raise ArgumentError, "Invalid current indent, expected fixnum" unless @cur_indent.is_a? Fixnum
      raise ArgumentError, "Invalid indent size, expected fixnum" unless @indent_size.is_a? Fixnum
    end

    def process_token(token, payload = nil)
      unless self.class.rules.has_key? token
        raise ArgumentError, "No rule exists for token #{token.inspect}"
      end

      apply_rule self.class.rules[token], payload
    end

    def apply_rule(rule, payload = nil)
      @cur_indent += rule[:indent] if rule[:indent]

      if rule[:break_before]
        @out.print "\n" << " " * @cur_indent * @indent_size
      end

      @out.print rule[:payload] || payload.to_s

      if rule[:break_after]
        @out.print "\n" << " " * @cur_indent * @indent_size
      end
    end
  end
end
