class Jiffy
  module Outputters
    module CommonRules
      class << self
        def included(base)
          base.instance_eval do
            rule :begin_object, :payload => "{", :indent => 1, :break_after => true
            rule :end_object, :payload => "}", :indent => -1, :break_before => true
            rule :begin_array, :payload => "[", :indent => 1, :break_after => true
            rule :end_array, :payload => "]", :indent => -1, :break_before => true
            rule :value_separator, :payload => ",", :break_after => true
            rule :char, :color => :purple
            rule :escaped_quotation_mark, :payload => "\\\""
            rule :escaped_reverse_solidus, :payload => "\\\\"
            rule :escaped_solidus, :payload => "\\/"
            rule :escaped_backspace, :payload => "\\b"
            rule :escaped_formfeed, :payload => "\\f"
            rule :escaped_newline, :payload => "\\n"
            rule :escaped_carriage_return, :payload => "\\r"
            rule :escaped_horizontal_tab, :payload => "\\t"
            rule :escaped_unicode do |sequence|
              "\\u#{sequence}"
            end
          end
        end
      end
    end
  end
end
