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

  private

  def raise_unparseable(p)
    if !@io.closed? && @io.eof? && @data.length == p
      raise UnexpectedEndError, 'Unexpected end of input'
    else
      raise UnparseableError, "Unexpected token at position #{p}"
    end
  end
end
