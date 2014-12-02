require 'json_better_formatter/parsers/json'
require 'json_better_formatter/parsers/json_array'
require 'json_better_formatter/parsers/json_float'
require 'json_better_formatter/parsers/json_object'
require 'json_better_formatter/parsers/json_string'
require 'json_better_formatter/parsers/json_value'
require 'json_better_formatter/json_outputter'

class JsonBetterFormatter
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
