%%{
    machine json_integer;

    action exit { fhold; fbreak; }

    main := '-'? ('0' | [1-9][0-9]*) (^[0-9]? @exit);
}%%

class JsonBetterFormatter
  module Parsers
    module JsonInteger
      def initialize(*args)
        %% write data;
        super
      end

      def parse_json_integer(p, pe)
        t_p = p

        %% write init;
        %% write exec;

        if cs >= json_integer_first_final
          o.output data.range(t_p...p).pack('c*')

          p
        end
      end
    end
  end
end
