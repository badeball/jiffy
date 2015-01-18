%%{
    machine json_value;
    include json_common "json_common.rl";

    action parse_string {
      fexec JsonString.new(p: p, data: data, outputter: outputter).parse;
    }

    action parse_number {
      fexec JsonFloat.new(p: p, data: data, outputter: outputter).parse;
    }

    action parse_array {
      fexec JsonArray.new(p: p, data: data, outputter: outputter).parse;
    }

    action parse_object {
      fexec JsonObject.new(p: p, data: data, outputter: outputter).parse;
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

class Jiffy
  module Parsers
    class JsonValue < Parser
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

        if cs >= json_value_first_final
          p
        else
          raise_unparseable p
        end
      end
    end
  end
end
