%%{
    machine json_array;
    include json_common "json_common.rl";

    action parse_value {
      np = parse_json_value(fpc, pe)

      if np
        fexec np;
      else
        fhold; fbreak;
      end
    }

    action exit { fhold; fbreak; }

    next_element  = value_separator >{ o.t :value_separator } ignore* begin_value >parse_value;

    main := begin_array >{ o.t :begin_array } ignore*
          ((begin_value >parse_value ignore*)
           (ignore* next_element ignore*)*)?
          end_array >{ o.t :end_array } @exit;
}%%

class Jiffy
  module Parsers
    module JsonArray
      def initialize(*args)
        %% write data;
        super
      end

      def parse_json_array(p, pe)
        %% write init;
        %% write exec;

        if cs >= json_array_first_final
          p + 1
        else
          raise_unparseable p
        end
      end
    end
  end
end
