%%{
    machine json_object;
    include json_common "json_common.rl";

    action parse_value {
        np = parse_json_value(fpc, pe)

        if np
            fexec np;
        else
            fhold; fbreak;
        end
    }

    action parse_name {
        np = parse_json_string(fpc, pe)

        if np
            fexec np;
        else
            fhold; fbreak;
        end
    }

    action exit { fhold; fbreak; }

    pair = ignore* begin_name >{ o.t :begin_string } >parse_name @{ o.t :end_string } ignore* name_separator >{ o.t :name_separator } ignore* begin_value >parse_value;

    next_pair = ignore* value_separator >{ o.t :value_separator } pair;

    main := (
        begin_object >{ o.t :begin_object }
        (pair (next_pair)*)? ignore*
        end_object >{ o.t :end_object }
    ) @exit;
}%%

class JsonBetterFormatter
  module Parsers
    module JsonObject
      def initialize(*args)
        %% write data;
        super
      end

      def parse_json_object(p, pe)
        %% write init;
        %% write exec;

        if cs >= json_object_first_final
          p + 1
        else
          raise_unparseable p
        end
      end
    end
  end
end
