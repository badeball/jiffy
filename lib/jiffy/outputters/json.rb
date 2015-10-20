class Jiffy
  module Outputters
    class Json < Outputter
      include CommonRules

      rule :name_separator, :payload => ": "
      rule :begin_name, :payload => "\"", :color => :purple
      rule :end_name, :payload => "\"", :color => :purple
      rule :begin_string, :payload => "\"", :color => :purple
      rule :end_string, :payload => "\"", :color => :purple
      rule :null, :payload => "null", :color => :gray
      rule :true, :payload => "true", :color => :blue
      rule :false, :payload => "false", :color => :blue
      rule :number, :color => :cyan
      rule :exponent, :payload => "e", :color => :cyan
      rule :minus, :payload => "-", :color => :cyan
      rule :plus, :payload => "+", :color => :cyan
    end
  end
end
