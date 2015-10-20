
# line 1 "json_string.rl"

# line 29 "json_string.rl"


class Jiffy
  module Parsers
    class JsonString < Parser
      def initialize(*args)
        
# line 13 "json_string.rb"
class << self
	attr_accessor :_json_string_actions
	private :_json_string_actions, :_json_string_actions=
end
self._json_string_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4, 1, 5, 1, 6, 1, 
	7, 1, 8, 1, 9, 1, 10, 1, 
	11, 2, 11, 12
]

class << self
	attr_accessor :_json_string_key_offsets
	private :_json_string_key_offsets, :_json_string_key_offsets=
end
self._json_string_key_offsets = [
	0, 0, 1, 5, 14, 20, 26, 32, 
	38
]

class << self
	attr_accessor :_json_string_trans_keys
	private :_json_string_trans_keys, :_json_string_trans_keys=
end
self._json_string_trans_keys = [
	34, 34, 92, 0, 31, 34, 47, 92, 
	98, 102, 110, 114, 116, 117, 48, 57, 
	65, 70, 97, 102, 48, 57, 65, 70, 
	97, 102, 48, 57, 65, 70, 97, 102, 
	48, 57, 65, 70, 97, 102, 0
]

class << self
	attr_accessor :_json_string_single_lengths
	private :_json_string_single_lengths, :_json_string_single_lengths=
end
self._json_string_single_lengths = [
	0, 1, 2, 9, 0, 0, 0, 0, 
	0
]

class << self
	attr_accessor :_json_string_range_lengths
	private :_json_string_range_lengths, :_json_string_range_lengths=
end
self._json_string_range_lengths = [
	0, 0, 1, 0, 3, 3, 3, 3, 
	0
]

class << self
	attr_accessor :_json_string_index_offsets
	private :_json_string_index_offsets, :_json_string_index_offsets=
end
self._json_string_index_offsets = [
	0, 0, 2, 6, 16, 20, 24, 28, 
	32
]

class << self
	attr_accessor :_json_string_trans_targs
	private :_json_string_trans_targs, :_json_string_trans_targs=
end
self._json_string_trans_targs = [
	2, 0, 8, 3, 0, 2, 2, 2, 
	2, 2, 2, 2, 2, 2, 4, 0, 
	5, 5, 5, 0, 6, 6, 6, 0, 
	7, 7, 7, 0, 2, 2, 2, 0, 
	0, 0
]

class << self
	attr_accessor :_json_string_trans_actions
	private :_json_string_trans_actions, :_json_string_trans_actions=
end
self._json_string_trans_actions = [
	0, 0, 1, 21, 0, 3, 5, 9, 
	7, 11, 13, 15, 17, 19, 0, 0, 
	23, 23, 23, 0, 23, 23, 23, 0, 
	23, 23, 23, 0, 25, 25, 25, 0, 
	0, 0
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


# line 36 "json_string.rl"

        super
      end

      def parse
        pe = :ignored
        eof = :ignored
        p = self.position

        
# line 127 "json_string.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = json_string_start
end

# line 46 "json_string.rl"
        
# line 136 "json_string.rb"
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
when 1 then
# line 7 "json_string.rl"
		begin
 y << [:char, [data[p]].pack("c*")] 		end
when 2 then
# line 13 "json_string.rl"
		begin
 y << :escaped_quotation_mark 		end
when 3 then
# line 14 "json_string.rl"
		begin
 y << :escaped_reverse_solidus 		end
when 4 then
# line 15 "json_string.rl"
		begin
 y << :escaped_solidus 		end
when 5 then
# line 16 "json_string.rl"
		begin
 y << :escaped_backspace 		end
when 6 then
# line 17 "json_string.rl"
		begin
 y << :escaped_formfeed 		end
when 7 then
# line 18 "json_string.rl"
		begin
 y << :escaped_newline 		end
when 8 then
# line 19 "json_string.rl"
		begin
 y << :escaped_carriage_return 		end
when 9 then
# line 20 "json_string.rl"
		begin
 y << :escaped_horizontal_tab 		end
when 10 then
# line 23 "json_string.rl"
		begin
 unicode_sequence = "" 		end
when 11 then
# line 23 "json_string.rl"
		begin
 unicode_sequence << [data[p]].pack("c*") 		end
when 12 then
# line 23 "json_string.rl"
		begin
 y << [:escaped_unicode, unicode_sequence.to_s] 		end
# line 274 "json_string.rb"
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

# line 47 "json_string.rl"

        if cs >= json_string_first_final
          p + 1
        else
          raise_unparseable p
        end
      end
    end
  end
end
