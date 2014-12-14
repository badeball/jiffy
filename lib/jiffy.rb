require 'jiffy/parsers/json'
require 'jiffy/parsers/json_array'
require 'jiffy/parsers/json_float'
require 'jiffy/parsers/json_object'
require 'jiffy/parsers/json_string'
require 'jiffy/parsers/json_value'
require 'jiffy/json_outputter'

class Jiffy
  class UnparseableError < StandardError; end
  class UnexpectedEndError < StandardError; end

  class << self
    attr_accessor :json_start
  end

  prepend Parsers::Json
  prepend Parsers::JsonArray
  prepend Parsers::JsonFloat
  prepend Parsers::JsonObject
  prepend Parsers::JsonString
  prepend Parsers::JsonValue

  attr_accessor :io, :data, :outputter

  alias_method :o, :outputter
  alias_method :format, :parse_json

  def initialize(options = {})
    if options[:in].is_a?(String)
      @io = File.open(options[:in])
    elsif options[:in].respond_to?(:read)
      @io = options[:in]
    else
      raise ArgumentError, 'Invalid input source'
    end

    @outputter = JsonOutputter.new(options)
  end

  def cl_format(options = {})
    format

    @outputter.t :char, "\n"

    true
  rescue Errno::EACCES
    err = options[:err] || $stderr

    if @io.respond_to? :filename
      err.write "jiffy: #{@io.filename}: Permission denied\n"
    else
      err.write "jiffy: Permission denied\n"
    end

    false
  rescue Errno::ENOENT
    err = options[:err] || $stderr

    if @io.respond_to? :filename
      err.write "jiffy: #{@io.filename}: No such file or directory\n"
    else
      err.write "jiffy: No such file or directory\n"
    end

    false
  rescue Errno::EISDIR
    err = options[:err] || $stderr

    if @io.respond_to? :filename
      err.write "jiffy: #{@io.filename}: Is a directory\n"
    else
      err.write "jiffy: Is a directory\n"
    end

    false
  rescue UnexpectedEndError, UnparseableError => e
    err = options[:err] || $stderr

    err.write e.message << "\n"

    false
  end

  private

  def raise_unparseable(p)
    if (@io.closed? || @io.eof?) && (@data.nil? || @data.length == p)
      raise UnexpectedEndError, 'Unexpected end of input'
    else
      raise UnparseableError, "Unexpected token at position #{p}"
    end
  end
end
