class Jiffy
  class CL
    def initialize(options = {})
      @in = options[:in]
      @err = options[:err] || $stderr
      @jiffy = options[:jiffy] || Jiffy.new(options)
      @outputter = options[:outputter]
    end

    def format
      @jiffy.format

      @outputter.process_token :char, "\n"

      true
    rescue Errno::EACCES
      @err.puts "jiffy: #{@in.filename}: Permission denied"
    rescue Errno::ENOENT
      @err.puts "jiffy: #{@in.filename}: No such file or directory"
    rescue Errno::EISDIR
      @err.puts "jiffy: #{@in.filename}: Is a directory"
    rescue UnexpectedEndError
      @err.puts "jiffy: Unexpected end of input"
    rescue UnparseableError => e
      @err.puts "jiffy: Unexpected token at position #{e.position}"
    end
  end
end
