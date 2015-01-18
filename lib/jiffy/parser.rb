class Jiffy
  class Parser
    attr_accessor :p, :data, :outputter

    alias_method :o, :outputter

    def initialize(options = {})
      self.p = options[:p]
      self.data = options[:data]
      self.outputter = options[:outputter]
    end

    def raise_unparseable(p)
      raise UnparseableError, "Unexpected token at position #{p}"
    end
  end
end
