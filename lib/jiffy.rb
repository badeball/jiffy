require "jiffy/array_mimicking_io"
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
  class UnparseableError < StandardError; end
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
          raise UnexpectedEndError, "Unexpected end of input"
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

  def cl_format
    format

    @outputter.process_token :char, "\n"

    true
  rescue Errno::EACCES
    @err.puts "jiffy: #{@io.filename}: Permission denied"
  rescue Errno::ENOENT
    @err.puts "jiffy: #{@io.filename}: No such file or directory"
  rescue Errno::EISDIR
    @err.puts "jiffy: #{@io.filename}: Is a directory"
  rescue UnexpectedEndError, UnparseableError => e
    @err.puts e.message
  end
end
