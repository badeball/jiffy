class Jiffy
  class JsonOutputter
    attr_accessor :out, :indent

    def initialize(options)
      self.out = options[:out] || $stdout

      raise ArgumentError, 'Invalid output source' unless out.respond_to? :print

      self.indent = 0
    end

    def process_token(token, payload = nil)
      case token
        when :begin_object
          output '{', indent: 1, newline_after: true
        when :end_object
          output '}', indent: -1, newline_before: true
        when :begin_array
          output '[', indent: 1, newline_after: true
        when :end_array
          output ']', indent: -1, newline_before: true
        when :value_separator
          output ',', newline_after: true
        when :name_separator
          output ': '
        when :begin_string, :end_string
          output '"'
        when :null
          output 'null'
        when :nan
          output 'NaN'
        when :inf
          output 'Infinity'
        when :true
          output 'true'
        when :false
          output 'false'
        when :char
          output payload
        when :number
          output payload.to_s
        else
          puts "Unknown token: #{token.inspect}"
      end
    end

    alias_method :t, :process_token

    def output(content, options = {})
      self.indent += options[:indent] if options[:indent]

      if options[:newline_before]
        out.print "\n" << '  ' * self.indent
      end

      out.print content

      out.print "\n" << '  ' * self.indent if options[:newline_after]
    end
  end
end
