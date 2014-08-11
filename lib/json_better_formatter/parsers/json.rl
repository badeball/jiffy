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
        %% write init;
        %% write exec;

        unless p == pe
          puts "Unexpected token at '#{[data[p]].pack("c*")}'"
        end
      end
    end
  end
end
