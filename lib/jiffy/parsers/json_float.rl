%%{
    machine json_float;
    include json_common "json_common.rl";

    action exit { fhold; fbreak; }

    action char { o.t :char, [data[p]].pack("c*") }
    action number { o.t :number, [data[p]].pack("c*").to_i }

    significand = '-'? @char ('0' >number | [1-9] >char [0-9]* $number) ('.' >char [0-9]+ $number)?;

    exponent = [Ee] >char [+\-]? @char [0-9]+ $number;

    main := (significand exponent?) (^[0-9Ee.\-]? @exit );
}%%

class Jiffy
  module Parsers
    module JsonFloat
      def initialize(*args)
        %% write data;
        super
      end

      def parse_json_float(p, pe)
        t_p = p

        %% write init;
        %% write exec;

        if cs >= json_float_first_final
          p
        end
      end
    end
  end
end
