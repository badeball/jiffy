require "jiffy/array_mimicking_io"
require "jiffy/cl"
require "jiffy/outputter"
require "jiffy/outputters/json"
require "jiffy/outputters/ruby"
require "jiffy/parser"
require "jiffy/parsers/json"
require "jiffy/parsers/json_array"
require "jiffy/parsers/json_float"
require "jiffy/parsers/json_object"
require "jiffy/parsers/json_string"
require "jiffy/parsers/json_value"

class Jiffy
  class UnparseableError < StandardError
    attr_accessor :position

    def initialize(position)
      @position = position
    end
  end

  class UnexpectedEndError < StandardError; end

  def initialize(options = {})
    unless options[:in].respond_to?(:readpartial)
      raise ArgumentError, "Invalid input source"
    end

    @data = ArrayMimickingIO.new(options[:in])

    @err = options[:err] || $stdout

    @outputter = options[:outputter]
  end

  def tokenize
    Enumerator.new do |yielder|
      begin
        parser = Parsers::Json.new(data: @data, yielder: yielder)
        parser.parse
      rescue EOFError
        if parser.position < @data.bytes_read || @data.bytes_read == 0
          raise UnexpectedEndError
        end
      end
    end
  end

  def format
    enumerator = tokenize

    loop do
      @outputter.process_token *enumerator.next
    end
  end
end
