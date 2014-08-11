class JsonBetterFormatter
  class ArrayMimickingIO
    CHUNK_SIZE = 1_000_000 # 1 MB
    CHUNK_LIMIT = 100 # Keep no more than N chunks in memory at any given time.

    attr_accessor :io, :chunks, :chunk_order

    def initialize(io)
      self.io = io
      self.chunks = {}
      self.chunk_order = []
    end

    def length
      io.size
    end

    def [](nth_byte)
      chunk_index = nth_byte / CHUNK_SIZE

      read_chunk(chunk_index)[nth_byte % 1_000_000]
    end

    def range(range)
      range.each.map { |nth_byte| self[nth_byte] }
    end

    private

    def read_chunk(nth_chunk)
      unless chunks.has_key? nth_chunk
        io.seek nth_chunk * CHUNK_SIZE

        chunks[nth_chunk] = io.read(CHUNK_SIZE).codepoints

        chunk_order << nth_chunk

        if chunk_order.length > CHUNK_LIMIT
          chunks.delete chunk_order.shift
        end
      end

      chunks[nth_chunk]
    end
  end
end
