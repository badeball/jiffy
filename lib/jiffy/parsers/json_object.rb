
# line 1 "json_object.rl"

# line 24 "json_object.rl"


class Jiffy
  module Parsers
    class JsonObject < Parser
      def initialize(*args)
        
# line 13 "json_object.rb"
class << self
	attr_accessor :_json_object_actions
	private :_json_object_actions, :_json_object_actions=
end
self._json_object_actions = [
	0, 1, 0, 1, 5, 1, 6, 1, 
	7, 2, 8, 2, 3, 3, 1, 4
]

class << self
	attr_accessor :_json_object_key_offsets
	private :_json_object_key_offsets, :_json_object_key_offsets=
end
self._json_object_key_offsets = [
	0, 0, 1, 8, 14, 16, 17, 19, 
	20, 36, 43, 49, 51, 52, 54, 55, 
	57, 58, 60, 61, 63, 64, 66, 67, 
	69, 70, 72, 73
]

class << self
	attr_accessor :_json_object_trans_keys
	private :_json_object_trans_keys, :_json_object_trans_keys=
end
self._json_object_trans_keys = [
	123, 13, 32, 34, 47, 125, 9, 10, 
	13, 32, 47, 58, 9, 10, 42, 47, 
	42, 42, 47, 10, 13, 32, 34, 45, 
	47, 73, 78, 91, 102, 110, 116, 123, 
	9, 10, 48, 57, 13, 32, 44, 47, 
	125, 9, 10, 13, 32, 34, 47, 9, 
	10, 42, 47, 42, 42, 47, 10, 42, 
	47, 42, 42, 47, 10, 42, 47, 42, 
	42, 47, 10, 42, 47, 42, 42, 47, 
	10, 0
]

class << self
	attr_accessor :_json_object_single_lengths
	private :_json_object_single_lengths, :_json_object_single_lengths=
end
self._json_object_single_lengths = [
	0, 1, 5, 4, 2, 1, 2, 1, 
	12, 5, 4, 2, 1, 2, 1, 2, 
	1, 2, 1, 2, 1, 2, 1, 2, 
	1, 2, 1, 0
]

class << self
	attr_accessor :_json_object_range_lengths
	private :_json_object_range_lengths, :_json_object_range_lengths=
end
self._json_object_range_lengths = [
	0, 0, 1, 1, 0, 0, 0, 0, 
	2, 1, 1, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0
]

class << self
	attr_accessor :_json_object_index_offsets
	private :_json_object_index_offsets, :_json_object_index_offsets=
end
self._json_object_index_offsets = [
	0, 0, 2, 9, 15, 18, 20, 23, 
	25, 40, 47, 53, 56, 58, 61, 63, 
	66, 68, 71, 73, 76, 78, 81, 83, 
	86, 88, 91, 93
]

class << self
	attr_accessor :_json_object_indicies
	private :_json_object_indicies, :_json_object_indicies=
end
self._json_object_indicies = [
	0, 1, 2, 2, 3, 4, 5, 2, 
	1, 6, 6, 7, 8, 6, 1, 9, 
	10, 1, 11, 9, 11, 6, 9, 6, 
	10, 12, 12, 13, 13, 14, 13, 13, 
	13, 13, 13, 13, 13, 12, 13, 1, 
	15, 15, 16, 17, 5, 15, 1, 18, 
	18, 3, 19, 18, 1, 20, 21, 1, 
	22, 20, 22, 18, 20, 18, 21, 23, 
	24, 1, 25, 23, 25, 15, 23, 15, 
	24, 26, 27, 1, 28, 26, 28, 12, 
	26, 12, 27, 29, 30, 1, 31, 29, 
	31, 2, 29, 2, 30, 1, 0
]

class << self
	attr_accessor :_json_object_trans_targs
	private :_json_object_trans_targs, :_json_object_trans_targs=
end
self._json_object_trans_targs = [
	2, 0, 2, 3, 23, 27, 3, 4, 
	8, 5, 7, 6, 8, 9, 19, 9, 
	10, 15, 10, 11, 12, 14, 13, 16, 
	18, 17, 20, 22, 21, 24, 26, 25
]

class << self
	attr_accessor :_json_object_trans_actions
	private :_json_object_trans_actions, :_json_object_trans_actions=
end
self._json_object_trans_actions = [
	7, 0, 0, 12, 0, 9, 0, 0, 
	3, 0, 0, 0, 0, 1, 0, 0, 
	5, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :json_object_start
end
self.json_object_start = 1;
class << self
	attr_accessor :json_object_first_final
end
self.json_object_first_final = 27;
class << self
	attr_accessor :json_object_error
end
self.json_object_error = 0;

class << self
	attr_accessor :json_object_en_main
end
self.json_object_en_main = 1;


# line 31 "json_object.rl"

        super
      end

      def parse
        pe = :ignored
        eof = :ignored
        p = self.p

        
# line 155 "json_object.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = json_object_start
end

# line 41 "json_object.rl"
        
# line 164 "json_object.rb"
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
	_keys = _json_object_key_offsets[cs]
	_trans = _json_object_index_offsets[cs]
	_klen = _json_object_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _json_object_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _json_object_trans_keys[_mid]
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
	  _klen = _json_object_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _json_object_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _json_object_trans_keys[_mid+1]
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
	_trans = _json_object_indicies[_trans]
	cs = _json_object_trans_targs[_trans]
	if _json_object_trans_actions[_trans] != 0
		_acts = _json_object_trans_actions[_trans]
		_nacts = _json_object_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _json_object_actions[_acts - 1]
when 0 then
# line 5 "json_object.rl"
		begin

       begin p = (( JsonValue.new(p: p, data: data, yielder: yielder).parse))-1; end

    		end
when 1 then
# line 9 "json_object.rl"
		begin

       begin p = (( JsonString.new(p: p, data: data, yielder: yielder).parse))-1; end

    		end
when 2 then
# line 13 "json_object.rl"
		begin
 p = p - 1; 	begin
		p += 1
		_trigger_goto = true
		_goto_level = _out
		break
	end
 		end
when 3 then
# line 15 "json_object.rl"
		begin
 y << :begin_string 		end
when 4 then
# line 15 "json_object.rl"
		begin
 y << :end_string 		end
when 5 then
# line 15 "json_object.rl"
		begin
 y << :name_separator 		end
when 6 then
# line 17 "json_object.rl"
		begin
 y << :value_separator 		end
when 7 then
# line 20 "json_object.rl"
		begin
 y << :begin_object 		end
when 8 then
# line 22 "json_object.rl"
		begin
 y << :end_object 		end
# line 293 "json_object.rb"
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

# line 42 "json_object.rl"

        if cs >= json_object_first_final
          p + 1
        else
          raise_unparseable p
        end
      end
    end
  end
end
