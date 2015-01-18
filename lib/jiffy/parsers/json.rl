%%{
    machine json;
    include json_common "json_common.rl";

    action parse_object {
      fexec JsonObject.new(p: p, data: data, outputter: outputter).parse;
    }

    action parse_array {
      fexec JsonArray.new(p: p, data: data, outputter: outputter).parse;
    }

    main := ignore* (
              begin_object >parse_object |
              begin_array >parse_array
            ) ignore*;
}%%

class Jiffy
  module Parsers
    class Json < Parser
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

        raise_unparseable p unless p == data.bytes_read
      ensure
        self.p = p
      end
    end
  end
end
