class Jiffy
  class Parser
    attr_accessor :p, :data, :yielder

    alias_method :y, :yielder

    def initialize(options = {})
      self.p = options[:p]
      self.data = options[:data]
      self.yielder = options[:yielder]
    end

    def raise_unparseable(p)
      raise UnparseableError, "Unexpected token at position #{p}"
    end
  end
end
