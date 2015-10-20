require 'jiffy/array_mimicking_io'
require 'jiffy/outputter'
require 'jiffy/outputters/json'
require 'jiffy/outputters/ruby'
require 'jiffy/parser'
require 'jiffy/parsers/json'
require 'jiffy/parsers/json_array'
require 'jiffy/parsers/json_float'
require 'jiffy/parsers/json_object'
require 'jiffy/parsers/json_string'
require 'jiffy/parsers/json_value'

class Jiffy
  class UnparseableError < StandardError; end
  class UnexpectedEndError < StandardError; end

  def initialize(options = {})
    if options[:in].is_a?(String)
      @io = File.open(options[:in])
    elsif options[:in].respond_to?(:readpartial)
      @io = options[:in]
    else
      raise ArgumentError, 'Invalid input source'
    end

    @data = ArrayMimickingIO.new(@io)
  end

  def tokenize
    Enumerator.new do |yielder|
      begin
        parser = Parsers::Json.new(p: 0, data: @data, yielder: yielder)
        parser.parse
      rescue EOFError
        if parser.p < @data.bytes_read || @data.bytes_read == 0
          raise UnexpectedEndError, 'Unexpected end of input'
        end
      end
    end
  end

  def format(options = {})
    enumerator = tokenize

    loop do
      options[:outputter].process_token *enumerator.next
    end
  end

  def cl_format(options = {})
    format options

    options[:outputter].process_token :char, "\n"

    true
  rescue Errno::EACCES
    err = options[:err] || $stderr

    err.write "jiffy: #{@io.filename}: Permission denied\n"

    false
  rescue Errno::ENOENT
    err = options[:err] || $stderr

    err.write "jiffy: #{@io.filename}: No such file or directory\n"

    false
  rescue Errno::EISDIR
    err = options[:err] || $stderr

    err.write "jiffy: #{@io.filename}: Is a directory\n"

    false
  rescue UnexpectedEndError, UnparseableError => e
    err = options[:err] || $stderr

    err.write e.message << "\n"

    false
  end
end
