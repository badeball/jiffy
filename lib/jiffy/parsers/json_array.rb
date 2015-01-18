
# line 1 "json_array.rl"

# line 17 "json_array.rl"


class Jiffy
  module Parsers
    class JsonArray < Parser
      def initialize(*args)
        
# line 13 "json_array.rb"
class << self
	attr_accessor :_json_array_actions
	private :_json_array_actions, :_json_array_actions=
end
self._json_array_actions = [
	0, 1, 0, 1, 2, 1, 3, 2, 
	4, 1
]

class << self
	attr_accessor :_json_array_key_offsets
	private :_json_array_key_offsets, :_json_array_key_offsets=
end
self._json_array_key_offsets = [
	0, 0, 1, 18, 25, 41, 43, 44, 
	46, 47, 49, 50, 52, 53, 55, 56, 
	58, 59
]

class << self
	attr_accessor :_json_array_trans_keys
	private :_json_array_trans_keys, :_json_array_trans_keys=
end
self._json_array_trans_keys = [
	91, 13, 32, 34, 45, 47, 73, 78, 
	91, 93, 102, 110, 116, 123, 9, 10, 
	48, 57, 13, 32, 44, 47, 93, 9, 
	10, 13, 32, 34, 45, 47, 73, 78, 
	91, 102, 110, 116, 123, 9, 10, 48, 
	57, 42, 47, 42, 42, 47, 10, 42, 
	47, 42, 42, 47, 10, 42, 47, 42, 
	42, 47, 10, 0
]

class << self
	attr_accessor :_json_array_single_lengths
	private :_json_array_single_lengths, :_json_array_single_lengths=
end
self._json_array_single_lengths = [
	0, 1, 13, 5, 12, 2, 1, 2, 
	1, 2, 1, 2, 1, 2, 1, 2, 
	1, 0
]

class << self
	attr_accessor :_json_array_range_lengths
	private :_json_array_range_lengths, :_json_array_range_lengths=
end
self._json_array_range_lengths = [
	0, 0, 2, 1, 2, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0
]

class << self
	attr_accessor :_json_array_index_offsets
	private :_json_array_index_offsets, :_json_array_index_offsets=
end
self._json_array_index_offsets = [
	0, 0, 2, 18, 25, 40, 43, 45, 
	48, 50, 53, 55, 58, 60, 63, 65, 
	68, 70
]

class << self
	attr_accessor :_json_array_indicies
	private :_json_array_indicies, :_json_array_indicies=
end
self._json_array_indicies = [
	0, 1, 2, 2, 3, 3, 4, 3, 
	3, 3, 5, 3, 3, 3, 3, 2, 
	3, 1, 6, 6, 7, 8, 5, 6, 
	1, 9, 9, 3, 3, 10, 3, 3, 
	3, 3, 3, 3, 3, 9, 3, 1, 
	11, 12, 1, 13, 11, 13, 9, 11, 
	9, 12, 14, 15, 1, 16, 14, 16, 
	6, 14, 6, 15, 17, 18, 1, 19, 
	17, 19, 2, 17, 2, 18, 1, 0
]

class << self
	attr_accessor :_json_array_trans_targs
	private :_json_array_trans_targs, :_json_array_trans_targs=
end
self._json_array_trans_targs = [
	2, 0, 2, 3, 13, 17, 3, 4, 
	9, 4, 5, 6, 8, 7, 10, 12, 
	11, 14, 16, 15
]

class << self
	attr_accessor :_json_array_trans_actions
	private :_json_array_trans_actions, :_json_array_trans_actions=
end
self._json_array_trans_actions = [
	5, 0, 0, 1, 0, 7, 0, 3, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0
]

class << self
	attr_accessor :json_array_start
end
self.json_array_start = 1;
class << self
	attr_accessor :json_array_first_final
end
self.json_array_first_final = 17;
class << self
	attr_accessor :json_array_error
end
self.json_array_error = 0;

class << self
	attr_accessor :json_array_en_main
end
self.json_array_en_main = 1;


# line 24 "json_array.rl"

        super
      end

      def parse
        pe = :ignored
        eof = :ignored
        p = self.p

        
# line 144 "json_array.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = json_array_start
end

# line 34 "json_array.rl"
        
# line 153 "json_array.rb"
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
	_keys = _json_array_key_offsets[cs]
	_trans = _json_array_index_offsets[cs]
	_klen = _json_array_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _json_array_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _json_array_trans_keys[_mid]
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
	  _klen = _json_array_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _json_array_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _json_array_trans_keys[_mid+1]
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
	_trans = _json_array_indicies[_trans]
	cs = _json_array_trans_targs[_trans]
	if _json_array_trans_actions[_trans] != 0
		_acts = _json_array_trans_actions[_trans]
		_nacts = _json_array_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _json_array_actions[_acts - 1]
when 0 then
# line 5 "json_array.rl"
		begin

       begin p = (( JsonValue.new(p: p, data: data, yielder: yielder).parse))-1; end

    		end
when 1 then
# line 9 "json_array.rl"
		begin
 p = p - 1; 	begin
		p += 1
		_trigger_goto = true
		_goto_level = _out
		break
	end
 		end
when 2 then
# line 11 "json_array.rl"
		begin
 y << :value_separator 		end
when 3 then
# line 13 "json_array.rl"
		begin
 y << :begin_array 		end
when 4 then
# line 16 "json_array.rl"
		begin
 y << :end_array 		end
# line 263 "json_array.rb"
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

# line 35 "json_array.rl"

        if cs >= json_array_first_final
          p + 1
        else
          raise_unparseable p
        end
      end
    end
  end
end
