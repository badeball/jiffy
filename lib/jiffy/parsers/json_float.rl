%%{
    machine json_float;
    include json_common "json_common.rl";

    action exit { fhold; fbreak; }

    action char { y << [:char, [data[p]].pack("c*")] }
    action number { y << [:number, [data[p]].pack("c*").to_i] }

    significand = '-'? @char ('0' >number | [1-9] >char [0-9]* $number) ('.' >char [0-9]+ $number)?;

    exponent = [Ee] >char [+\-]? @char [0-9]+ $number;

    main := (significand exponent?) (^[0-9Ee.\-]? @exit );
}%%

class Jiffy
  module Parsers
    class JsonFloat < Parser
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

        if cs >= json_float_first_final
          p
        else
          raise_unparseable p
        end
      end
    end
  end
end
