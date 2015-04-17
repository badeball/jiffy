class Jiffy
  module Outputters
    class Json < Outputter
      rule :begin_object, :payload => "{", :indent => 1, :break_after => true
      rule :end_object, :payload => "}", :indent => -1, :break_before => true
      rule :begin_array, :payload => "[", :indent => 1, :break_after => true
      rule :end_array, :payload => "]", :indent => -1, :break_before => true
      rule :value_separator, :payload => ",", :break_after => true
      rule :name_separator, :payload => ": "
      rule :begin_name, :payload => "\""
      rule :end_name, :payload => "\""
      rule :begin_string, :payload => "\""
      rule :end_string, :payload => "\""
      rule :null, :payload =>  "null"
      rule :true, :payload =>  "true"
      rule :false, :payload =>  "false"
      rule :char
      rule :number
      rule :exponent, :payload => "e"
    end
  end
end
