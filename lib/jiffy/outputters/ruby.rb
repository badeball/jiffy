class Jiffy
  module Outputters
    class Ruby < Outputter
      rule :begin_object, :payload => "{", :indent => 1, :break_after => true
      rule :end_object, :payload => "}", :indent => -1, :break_before => true
      rule :begin_array, :payload => "[", :indent => 1, :break_after => true
      rule :end_array, :payload => "]", :indent => -1, :break_before => true
      rule :value_separator, :payload => ",", :break_after => true
      rule :name_separator, :payload => " => "
      rule :begin_name, :payload => "\""
      rule :end_name, :payload => "\""
      rule :begin_string, :payload => "\""
      rule :end_string, :payload => "\""
      rule :null, :payload => "nil"
      rule :true, :payload => "true"
      rule :false, :payload => "false"
      rule :char
      rule :number
      rule :exponent, :payload => "e"
      rule :minus, :payload => "-"
      rule :plus, :payload => "+"
      rule :escaped_quotation_mark, :payload => "\""
      rule :escaped_reverse_solidus, :payload => "\\"
      rule :escaped_solidus, :payload => "/"
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
