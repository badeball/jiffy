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

class Jiffy
  module Parsers
    module Json
      def initialize(*args)
        %% write data;
        super
      end

      def parse_json
        pe = :ignored
        eof = :ignored

        begin
          %% write init;
          %% write exec;
        rescue EOFError
          if p < data.bytes_read || data.bytes_read == 0
            raise UnexpectedEndError, 'Unexpected end of input'
          end
        end

        raise_unparseable p unless p == data.bytes_read
      end
    end
  end
end
