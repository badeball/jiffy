%%{
    machine json_object;
    include json_common "json_common.rl";

    action parse_value {
      fexec JsonValue.new(p: p, data: data, outputter: outputter).parse;
    }

    action parse_name {
      fexec JsonString.new(p: p, data: data, outputter: outputter).parse;
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

class Jiffy
  module Parsers
    class JsonObject < Parser
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

        if cs >= json_object_first_final
          p + 1
        else
          raise_unparseable p
        end
      end
    end
  end
end
