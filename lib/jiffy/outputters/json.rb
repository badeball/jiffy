class Jiffy
  module Outputters
    class Json < Outputter
      rule :begin_object, :payload => "{", :indent => 1, :break_after => true
      rule :end_object, :payload => "}", :indent => -1, :break_before => true
      rule :begin_array, :payload => "[", :indent => 1, :break_after => true
      rule :end_array, :payload => "]", :indent => -1, :break_before => true
      rule :value_separator, :payload => ",", :break_after => true
      rule :name_separator, :payload => ": "
      rule :begin_name, :payload => "\"", :color => :purple
      rule :end_name, :payload => "\"", :color => :purple
      rule :begin_string, :payload => "\"", :color => :purple
      rule :end_string, :payload => "\"", :color => :purple
      rule :null, :payload => "null", :color => :gray
      rule :true, :payload => "true", :color => :blue
      rule :false, :payload => "false", :color => :blue
      rule :char, :color => :purple
      rule :number, :color => :cyan
      rule :exponent, :payload => "e", :color => :cyan
      rule :minus, :payload => "-", :color => :cyan
      rule :plus, :payload => "+", :color => :cyan
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
