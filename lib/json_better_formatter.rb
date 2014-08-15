require 'json_better_formatter/parsers/json'
require 'json_better_formatter/parsers/json_array'
require 'json_better_formatter/parsers/json_float'
require 'json_better_formatter/parsers/json_integer'
require 'json_better_formatter/parsers/json_object'
require 'json_better_formatter/parsers/json_string'
require 'json_better_formatter/parsers/json_value'
require 'json_better_formatter/array_mimicking_io'
require 'json_better_formatter/json_outputter'

class JsonBetterFormatter
  class UnparseableError < StandardError; end

  class << self
    attr_accessor :json_start
  end

  prepend Parsers::Json
  prepend Parsers::JsonArray
  prepend Parsers::JsonFloat
  prepend Parsers::JsonInteger
  prepend Parsers::JsonObject
  prepend Parsers::JsonString
  prepend Parsers::JsonValue

  attr_accessor :data, :eof, :outputter

  alias_method :o, :outputter
  alias_method :format, :parse_json

  def initialize(options = {})
    if options[:in].is_a?(String)
      self.data = ArrayMimickingIO.new(File.open(options[:in]))
    elsif options[:in].is_a?(IO)
      self.data = ArrayMimickingIO.new(options[:in])
    else
      raise ArgumentError, 'Invalid input source'
    end

    self.eof = data.length
    self.outputter = JsonOutputter.new(options)
  end

  private

  def raise_unparseable(p)
    if p == eof
      raise UnparseableError.new('Unexpected end of input')
    else
      raise UnparseableError.new("Unexpected token at '#{[data[p]].pack("c*")}'")
    end
  end
end
