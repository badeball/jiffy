class Jiffy
  module Outputters
    class Ruby < Outputter
      include CommonRules

      rule :name_separator, :payload => " => "
      rule :begin_name, :payload => "\"", :color => :light_purple
      rule :end_name, :payload => "\"", :color => :light_purple
      rule :begin_string, :payload => "\"", :color => :light_purple
      rule :end_string, :payload => "\"", :color => :light_purple
      rule :null, :payload => "nil", :color => :purple
      rule :true, :payload => "true", :color => :purple
      rule :false, :payload => "false", :color => :purple
      rule :number, :color => :purple
      rule :exponent, :payload => "e", :color => :purple
      rule :minus, :payload => "-", :color => :purple
      rule :plus, :payload => "+", :color => :purple
    end
  end
end
