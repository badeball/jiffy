%%{
    machine json_array;
    include json_common "json_common.rl";

    action parse_value {
      fexec JsonValue.new(p: p, data: data, outputter: outputter).parse;
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
    class JsonArray < Parser
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

        if cs >= json_array_first_final
          p + 1
        else
          raise_unparseable p
        end
      end
    end
  end
end
