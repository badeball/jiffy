
# line 1 "json_float.rl"

# line 16 "json_float.rl"


class Jiffy
  module Parsers
    class JsonFloat < Parser
      def initialize(*args)
        
# line 13 "json_float.rb"
class << self
	attr_accessor :_json_float_actions
	private :_json_float_actions, :_json_float_actions=
end
self._json_float_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3
]

class << self
	attr_accessor :_json_float_key_offsets
	private :_json_float_key_offsets, :_json_float_key_offsets=
end
self._json_float_key_offsets = [
	0, 0, 4, 7, 9, 13, 15, 21, 
	21, 27, 33
]

class << self
	attr_accessor :_json_float_trans_keys
	private :_json_float_trans_keys, :_json_float_trans_keys=
end
self._json_float_trans_keys = [
	45, 48, 49, 57, 48, 49, 57, 48, 
	57, 43, 45, 48, 57, 48, 57, 45, 
	46, 69, 101, 48, 57, 69, 101, 45, 
	46, 48, 57, 69, 101, 45, 46, 48, 
	57, 45, 46, 69, 101, 48, 57, 0
]

class << self
	attr_accessor :_json_float_single_lengths
	private :_json_float_single_lengths, :_json_float_single_lengths=
end
self._json_float_single_lengths = [
	0, 2, 1, 0, 2, 0, 4, 0, 
	2, 2, 4
]

class << self
	attr_accessor :_json_float_range_lengths
	private :_json_float_range_lengths, :_json_float_range_lengths=
end
self._json_float_range_lengths = [
	0, 1, 1, 1, 1, 1, 1, 0, 
	2, 2, 1
]

class << self
	attr_accessor :_json_float_index_offsets
	private :_json_float_index_offsets, :_json_float_index_offsets=
end
self._json_float_index_offsets = [
	0, 0, 4, 7, 9, 13, 15, 21, 
	22, 27, 32
]

class << self
	attr_accessor :_json_float_indicies
	private :_json_float_indicies, :_json_float_indicies=
end
self._json_float_indicies = [
	0, 2, 3, 1, 2, 3, 1, 4, 
	1, 5, 5, 6, 1, 6, 1, 1, 
	8, 9, 9, 1, 7, 1, 9, 9, 
	1, 4, 7, 1, 1, 1, 6, 7, 
	1, 8, 9, 9, 3, 7, 0
]

class << self
	attr_accessor :_json_float_trans_targs
	private :_json_float_trans_targs, :_json_float_trans_targs=
end
self._json_float_trans_targs = [
	2, 0, 6, 10, 8, 5, 9, 7, 
	3, 4
]

class << self
	attr_accessor :_json_float_trans_actions
	private :_json_float_trans_actions, :_json_float_trans_actions=
end
self._json_float_trans_actions = [
	3, 0, 5, 5, 5, 3, 5, 1, 
	3, 7
]

class << self
	attr_accessor :json_float_start
end
self.json_float_start = 1;
class << self
	attr_accessor :json_float_first_final
end
self.json_float_first_final = 6;
class << self
	attr_accessor :json_float_error
end
self.json_float_error = 0;

class << self
	attr_accessor :json_float_en_main
end
self.json_float_en_main = 1;


# line 23 "json_float.rl"

        super
      end

      def parse
        pe = :ignored
        eof = :ignored
        p = self.p

        
# line 131 "json_float.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = json_float_start
end

# line 33 "json_float.rl"
        
# line 140 "json_float.rb"
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
	_keys = _json_float_key_offsets[cs]
	_trans = _json_float_index_offsets[cs]
	_klen = _json_float_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _json_float_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _json_float_trans_keys[_mid]
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
	  _klen = _json_float_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _json_float_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _json_float_trans_keys[_mid+1]
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
	_trans = _json_float_indicies[_trans]
	cs = _json_float_trans_targs[_trans]
	if _json_float_trans_actions[_trans] != 0
		_acts = _json_float_trans_actions[_trans]
		_nacts = _json_float_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _json_float_actions[_acts - 1]
when 0 then
# line 5 "json_float.rl"
		begin
 p = p - 1; 	begin
		p += 1
		_trigger_goto = true
		_goto_level = _out
		break
	end
 		end
when 1 then
# line 7 "json_float.rl"
		begin
 y << [:char, [data[p]].pack("c*")] 		end
when 2 then
# line 8 "json_float.rl"
		begin
 y << [:number, [data[p]].pack("c*").to_i] 		end
when 3 then
# line 9 "json_float.rl"
		begin
 y << :exponent 		end
# line 243 "json_float.rb"
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

# line 34 "json_float.rl"

        if cs >= json_float_first_final
          p
        else
          raise_unparseable p
        end
      end
    end
  end
end
