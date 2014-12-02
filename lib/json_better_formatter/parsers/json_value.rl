%%{
    machine json_value;
    include json_common "json_common.rl";

    action parse_string {
      np = parse_json_string(fpc, pe)

      if np
        fexec np;
      else
        raise_unparseable p
      end
    }

    action parse_number {
      np = parse_json_float(fpc, pe)

      if np
        fexec np;
      else
        raise_unparseable p
      end
    }

    action parse_array {
      np = parse_json_array(fpc, pe)

      if np
        fexec np;
      else
        raise_unparseable p
      end
    }

    action parse_object {
      np = parse_json_object(fpc, pe)

      if np
        fexec np;
      else
        raise_unparseable p
      end
    }

    action exit { fhold; fbreak; }

    main := (
        Vnull >{ o.t :null } |
        Vfalse >{ o.t :false } |
        Vtrue >{ o.t :true } |
        begin_number >parse_number |
        begin_string >{ o.t :begin_string } >parse_string @{ o.t :end_string } |
        begin_array >parse_array |
        begin_object >parse_object
    ) %*exit;
}%%

class JsonBetterFormatter
  module Parsers
    module JsonValue
      def initialize(*args)
        %% write data;
        super
      end

      def parse_json_value(p, pe)
        %% write init;
        %% write exec;

        if cs >= json_value_first_final
          p
        else
          raise_unparseable p
        end
      end
    end
  end
end
