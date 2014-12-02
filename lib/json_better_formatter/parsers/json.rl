%%{
    machine json;
    include json_common "json_common.rl";

    action parse_object {
      if np = parse_json_object(fpc, pe)
        fexec np;
      else
        fhold;
        fbreak;
      end
    }

    action parse_array {
      if np = parse_json_array(fpc, pe)
        fexec np;
      else
        fhold;
        fbreak;
      end
    }

    main := ignore* (
              begin_object >parse_object |
              begin_array >parse_array
            ) ignore*;
}%%

class JsonBetterFormatter
  module Parsers
    module Json
      def initialize(*args)
        %% write data;
        super
      end

      def parse_json
        pe = :ignored
        eof = :ignored
        leftover = []

        %% write init;

        while chunk = io.read(1_000_000)
          self.data = leftover + chunk.unpack("c*")
          p ||= 0
          pe = data.length

          %% write exec;
        end

        raise_unparseable p unless p == pe
      end
    end
  end
end
