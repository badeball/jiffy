class Jiffy
  class Outputter
    class << self
      attr_accessor :rules

      def rule(token, options = {}, &block)
        if options[:break_before] && options[:break_after]
          raise ArgumentError, "Cannot specify both :break_before and :break_after"
        end

        options[:format] ||= block
        @rules ||= {}
        @rules[token] = options
      end
    end

    COLOR_SEQUENCES = {
      reset: "\e[0m",
      black: "\e[0;30m",
      gray: "\e[0;37m",
      red: "\e[0;31m",
      green: "\e[0;32m",
      yellow: "\e[0;33m",
      blue: "\e[0;34m",
      purple: "\e[0;35m",
      light_purple: "\e[38;5;174m",
      cyan: "\e[0;36m",
      white: "\e[0;37m"
    }

    attr_accessor :out, :cur_indent, :indent_size, :last_color

    def initialize(options = {})
      @out = options[:out] || $stdout
      @color = options[:color]
      @last_color = options[:last_color]
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

      if @color
        if rule[:color]
          if @last_color.nil? || @last_color != rule[:color]
            @last_color = rule[:color]
            @out.print COLOR_SEQUENCES[rule[:color]]
          end
        elsif !@last_color.nil?
          @last_color = nil
          @out.print COLOR_SEQUENCES[:reset]
        end
      end

      payload ||= rule[:payload]

      if rule[:format]
        @out.print rule[:format].call payload
      else
        @out.print payload.to_s
      end

      if rule[:break_after]
        @out.print "\n" << " " * @cur_indent * @indent_size
      end
    end
  end
end
