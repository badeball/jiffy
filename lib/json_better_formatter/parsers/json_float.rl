%%{
    machine json_float;
    include json_common "json_common.rl";

    action exit { fhold; fbreak; }

    main := '-'? (
              (('0' | [1-9][0-9]*) '.' [0-9]+ ([Ee] [+\-]?[0-9]+)?)
              | (('0' | [1-9][0-9]*) ([Ee] [+\-]?[0-9]+))
             )  (^[0-9Ee.\-]? @exit );
}%%

class JsonBetterFormatter
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
          o.output data.range(t_p...p).pack('c*')

          p
        end
      end
    end
  end
end
