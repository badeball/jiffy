
# line 1 "json_string.rl"

# line 8 "json_string.rl"


class JsonBetterFormatter
  module Parsers
    module JsonString
      def initialize(*args)
        
# line 13 "json_string.rb"
class << self
	attr_accessor :_json_string_actions
	private :_json_string_actions, :_json_string_actions=
end
self._json_string_actions = [
	0, 1, 0
]

class << self
	attr_accessor :_json_string_key_offsets
	private :_json_string_key_offsets, :_json_string_key_offsets=
end
self._json_string_key_offsets = [
	0, 0, 1, 5, 8, 14, 20, 26, 
	32
]

class << self
	attr_accessor :_json_string_trans_keys
	private :_json_string_trans_keys, :_json_string_trans_keys=
end
self._json_string_trans_keys = [
	34, 34, 92, 0, 31, 117, 0, 31, 
	48, 57, 65, 70, 97, 102, 48, 57, 
	65, 70, 97, 102, 48, 57, 65, 70, 
	97, 102, 48, 57, 65, 70, 97, 102, 
	0
]

class << self
	attr_accessor :_json_string_single_lengths
	private :_json_string_single_lengths, :_json_string_single_lengths=
end
self._json_string_single_lengths = [
	0, 1, 2, 1, 0, 0, 0, 0, 
	0
]

class << self
	attr_accessor :_json_string_range_lengths
	private :_json_string_range_lengths, :_json_string_range_lengths=
end
self._json_string_range_lengths = [
	0, 0, 1, 1, 3, 3, 3, 3, 
	0
]

class << self
	attr_accessor :_json_string_index_offsets
	private :_json_string_index_offsets, :_json_string_index_offsets=
end
self._json_string_index_offsets = [
	0, 0, 2, 6, 9, 13, 17, 21, 
	25
]

class << self
	attr_accessor :_json_string_indicies
	private :_json_string_indicies, :_json_string_indicies=
end
self._json_string_indicies = [
	0, 1, 2, 3, 1, 0, 4, 1, 
	0, 5, 5, 5, 1, 6, 6, 6, 
	1, 7, 7, 7, 1, 0, 0, 0, 
	1, 1, 0
]

class << self
	attr_accessor :_json_string_trans_targs
	private :_json_string_trans_targs, :_json_string_trans_targs=
end
self._json_string_trans_targs = [
	2, 0, 8, 3, 4, 5, 6, 7
]

class << self
	attr_accessor :_json_string_trans_actions
	private :_json_string_trans_actions, :_json_string_trans_actions=
end
self._json_string_trans_actions = [
	0, 0, 1, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :json_string_start
end
self.json_string_start = 1;
class << self
	attr_accessor :json_string_first_final
end
self.json_string_first_final = 8;
class << self
	attr_accessor :json_string_error
end
self.json_string_error = 0;

class << self
	attr_accessor :json_string_en_main
end
self.json_string_en_main = 1;


# line 15 "json_string.rl"
        super
      end

      def parse_json_string(p, pe)
        t_p = p + 1

        
# line 124 "json_string.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = json_string_start
end

# line 22 "json_string.rl"
        
# line 133 "json_string.rb"
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
	_keys = _json_string_key_offsets[cs]
	_trans = _json_string_index_offsets[cs]
	_klen = _json_string_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _json_string_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _json_string_trans_keys[_mid]
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
	  _klen = _json_string_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _json_string_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _json_string_trans_keys[_mid+1]
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
	_trans = _json_string_indicies[_trans]
	cs = _json_string_trans_targs[_trans]
	if _json_string_trans_actions[_trans] != 0
		_acts = _json_string_trans_actions[_trans]
		_nacts = _json_string_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _json_string_actions[_acts - 1]
when 0 then
# line 5 "json_string.rl"
		begin
 p = p - 1; 	begin
		p += 1
		_trigger_goto = true
		_goto_level = _out
		break
	end
 		end
# line 224 "json_string.rb"
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

# line 23 "json_string.rl"

        if cs >= json_string_first_final
          o.output data.range(t_p...p).pack('c*')

          p + 1
        else
          raise_unparseable p
        end
      end
    end
  end
end
