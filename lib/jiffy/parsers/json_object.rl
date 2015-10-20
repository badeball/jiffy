%%{
    machine json_object;
    include json_common "json_common.rl";

    action parse_value {
      fexec JsonValue.new(p: p, data: data, yielder: yielder).parse;
    }

    action parse_name {
      fexec JsonString.new(p: p, data: data, yielder: yielder).parse;
    }

    action exit { fhold; fbreak; }

    pair = ignore* begin_name >{ y << :begin_name } >parse_name @{ y << :end_name } ignore* name_separator >{ y << :name_separator } ignore* begin_value >parse_value;

    next_pair = ignore* value_separator >{ y << :value_separator } pair;

    main := (
        begin_object >{ y << :begin_object }
        (pair (next_pair)*)? ignore*
        end_object >{ y << :end_object }
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
        p = self.position

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
