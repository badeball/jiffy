%%{
    machine json_string;
    include json_common "json_common.rl";

    action exit { fhold; fbreak; }

    action char { y << [:char, [data[p]].pack("c*")] }
    action unicode { y << [:unicode, data[(p-4)..p].pack("c*")] }

    character = ^([\"\\] | 0..0x1f) >char;

    sequence = '\\' (
      '"' >{ y << :escaped_quotation_mark } |
      '\\' >{ y << :escaped_reverse_solidus } |
      '/' >{ y << :escaped_solidus } |
      'b' >{ y << :escaped_backspace } |
      'f' >{ y << :escaped_formfeed } |
      'n' >{ y << :escaped_newline } |
      'r' >{ y << :escaped_carriage_return } |
      't' >{ y << :escaped_horizontal_tab }
    );

    unicode = '\\u' >{ unicode_sequence = "" } [0-9a-fA-F]{4} ${ unicode_sequence << [data[p]].pack("c*") } @{ y << [:escaped_unicode, unicode_sequence.to_s] };

    main := '"' (
                  character | sequence | unicode
                )*
            '"' @exit;
}%%

class Jiffy
  module Parsers
    class JsonString < Parser
      def initialize(*args)
        %% write data;

        super
      end

      def parse
        pe = :ignored
        eof = :ignored
        p = self.p

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
