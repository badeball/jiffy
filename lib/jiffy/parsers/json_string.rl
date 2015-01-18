%%{
    machine json_string;
    include json_common "json_common.rl";

    action exit { fhold; fbreak; }

    action char { o.t :char, [data[p]].pack("c*") }

    character = ^([\"\\] | 0..0x1f) >char;
    sequence = '\\' >char [\"\\/bfnrt] >char;
    unicode = '\\' >char 'u' >char [0-9a-fA-F]{4} $char;

    main := '"' (
                  character | sequence | unicode
                )*
            '"' @exit;
}%%

class Jiffy
  module Parsers
    module JsonString
      def initialize(*args)
        %% write data;
        super
      end

      def parse_json_string(p, pe)

        %% write init;
        %% write exec;

        if cs >= json_string_first_final
          p + 1
        else
          raise_unparseable p
        end
      end
    end
  end
end
