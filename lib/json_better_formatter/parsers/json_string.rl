%%{
    machine json_string;
    include json_common "json_common.rl";

    action parse_string {
      fexec p + 1;
    }

    action exit { fhold; fbreak; }

    main := '"' ((^([\"\\] | 0..0x1f) | '\\'[\"\\/bfnrt] | '\\u'[0-9a-fA-F]{4} | '\\'^([\"\\/bfnrtu]|0..0x1f))* %parse_string) '"' @exit;
}%%

class JsonBetterFormatter
  module Parsers
    module JsonString
      def initialize(*args)
        %% write data;
        super
      end

      def parse_json_string(p, pe)
        t_p = p + 1

        %% write init;
        %% write exec;

        if cs >= json_string_first_final
          o.output data.range(t_p...p).pack('c*')

          p + 1
        end
      end
    end
  end
end
