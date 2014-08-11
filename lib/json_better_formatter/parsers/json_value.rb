
# line 1 "json_value.rl"

# line 58 "json_value.rl"


class JsonBetterFormatter
  module Parsers
    module JsonValue
      def initialize(*args)
        
# line 13 "json_value.rb"
class << self
	attr_accessor :_json_value_actions
	private :_json_value_actions, :_json_value_actions=
end
self._json_value_actions = [
	0, 1, 1, 1, 2, 1, 3, 1, 
	4, 1, 5, 1, 6, 1, 7, 1, 
	8, 1, 9, 3, 10, 0, 11
]

class << self
	attr_accessor :_json_value_key_offsets
	private :_json_value_key_offsets, :_json_value_key_offsets=
end
self._json_value_key_offsets = [
	0, 0, 11, 12, 13, 14, 15, 16, 
	17, 18, 19, 20, 21, 22, 23, 24, 
	25, 26, 27, 28, 29
]

class << self
	attr_accessor :_json_value_trans_keys
	private :_json_value_trans_keys, :_json_value_trans_keys=
end
self._json_value_trans_keys = [
	34, 45, 73, 78, 91, 102, 110, 116, 
	123, 48, 57, 110, 102, 105, 110, 105, 
	116, 121, 97, 78, 97, 108, 115, 101, 
	117, 108, 108, 114, 117, 0
]

class << self
	attr_accessor :_json_value_single_lengths
	private :_json_value_single_lengths, :_json_value_single_lengths=
end
self._json_value_single_lengths = [
	0, 9, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 0
]

class << self
	attr_accessor :_json_value_range_lengths
	private :_json_value_range_lengths, :_json_value_range_lengths=
end
self._json_value_range_lengths = [
	0, 1, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0
]

class << self
	attr_accessor :_json_value_index_offsets
	private :_json_value_index_offsets, :_json_value_index_offsets=
end
self._json_value_index_offsets = [
	0, 0, 11, 13, 15, 17, 19, 21, 
	23, 25, 27, 29, 31, 33, 35, 37, 
	39, 41, 43, 45, 47
]

class << self
	attr_accessor :_json_value_trans_targs
	private :_json_value_trans_targs, :_json_value_trans_targs=
end
self._json_value_trans_targs = [
	20, 20, 2, 9, 20, 11, 15, 18, 
	20, 20, 0, 3, 0, 4, 0, 5, 
	0, 6, 0, 7, 0, 8, 0, 20, 
	0, 10, 0, 20, 0, 12, 0, 13, 
	0, 14, 0, 20, 0, 16, 0, 17, 
	0, 20, 0, 19, 0, 14, 0, 0, 
	0
]

class << self
	attr_accessor :_json_value_trans_actions
	private :_json_value_trans_actions, :_json_value_trans_actions=
end
self._json_value_trans_actions = [
	19, 1, 17, 15, 3, 11, 9, 13, 
	5, 1, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0
]

class << self
	attr_accessor :_json_value_from_state_actions
	private :_json_value_from_state_actions, :_json_value_from_state_actions=
end
self._json_value_from_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 7
]

class << self
	attr_accessor :json_value_start
end
self.json_value_start = 1;
class << self
	attr_accessor :json_value_first_final
end
self.json_value_first_final = 20;
class << self
	attr_accessor :json_value_error
end
self.json_value_error = 0;

class << self
	attr_accessor :json_value_en_main
end
self.json_value_en_main = 1;


# line 65 "json_value.rl"
        super
      end

      def parse_json_value(p, pe)
        
# line 138 "json_value.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = json_value_start
end

# line 70 "json_value.rl"
        
# line 147 "json_value.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_acts = _json_value_from_state_actions[cs]
	_nacts = _json_value_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _json_value_actions[_acts - 1]
			when 4 then
# line 45 "json_value.rl"
		begin
 p = p - 1; 	begin
		p += 1
		_trigger_goto = true
		_goto_level = _out
		break
	end
 		end
# line 186 "json_value.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _json_value_key_offsets[cs]
	_trans = _json_value_index_offsets[cs]
	_klen = _json_value_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _json_value_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _json_value_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _json_value_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _json_value_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _json_value_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	cs = _json_value_trans_targs[_trans]
	if _json_value_trans_actions[_trans] != 0
		_acts = _json_value_trans_actions[_trans]
		_nacts = _json_value_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _json_value_actions[_acts - 1]
when 0 then
# line 5 "json_value.rl"
		begin

      np = parse_json_string(p, pe)

      if np
         begin p = (( np))-1; end

      else
        p = p - 1; 	begin
		p += 1
		_trigger_goto = true
		_goto_level = _out
		break
	end

      end
    		end
when 1 then
# line 15 "json_value.rl"
		begin

      if np = parse_json_float(p, pe)
         begin p = (( np))-1; end

      elsif np = parse_json_integer(p, pe)
         begin p = (( np))-1; end

      else
        p = p - 1; 	begin
		p += 1
		_trigger_goto = true
		_goto_level = _out
		break
	end

      end
    		end
when 2 then
# line 25 "json_value.rl"
		begin

      np = parse_json_array(p, pe)

      if np
         begin p = (( np))-1; end

      else
        p = p - 1; 	begin
		p += 1
		_trigger_goto = true
		_goto_level = _out
		break
	end

      end
    		end
when 3 then
# line 35 "json_value.rl"
		begin

      np = parse_json_object(p, pe)

      if np
         begin p = (( np))-1; end

      else
        p = p - 1; 	begin
		p += 1
		_trigger_goto = true
		_goto_level = _out
		break
	end

      end
    		end
when 5 then
# line 48 "json_value.rl"
		begin
 o.t :null 		end
when 6 then
# line 49 "json_value.rl"
		begin
 o.t :false 		end
when 7 then
# line 50 "json_value.rl"
		begin
 o.t :true 		end
when 8 then
# line 51 "json_value.rl"
		begin
 o.t :nan 		end
when 9 then
# line 52 "json_value.rl"
		begin
 o.t :inf 		end
when 10 then
# line 54 "json_value.rl"
		begin
 o.t :begin_string 		end
when 11 then
# line 54 "json_value.rl"
		begin
 o.t :end_string 		end
# line 355 "json_value.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 71 "json_value.rl"

        p if cs >= json_value_first_final
      end
    end
  end
end
