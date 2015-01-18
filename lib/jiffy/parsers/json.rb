
# line 1 "json.rl"

# line 17 "json.rl"


class Jiffy
  module Parsers
    class Json < Parser
      def initialize(*args)
        
# line 13 "json.rb"
class << self
	attr_accessor :_json_actions
	private :_json_actions, :_json_actions=
end
self._json_actions = [
	0, 1, 0, 1, 1
]

class << self
	attr_accessor :_json_key_offsets
	private :_json_key_offsets, :_json_key_offsets=
end
self._json_key_offsets = [
	0, 0, 7, 9, 10, 12, 13, 15, 
	16, 18, 19
]

class << self
	attr_accessor :_json_trans_keys
	private :_json_trans_keys, :_json_trans_keys=
end
self._json_trans_keys = [
	13, 32, 47, 91, 123, 9, 10, 42, 
	47, 42, 42, 47, 10, 42, 47, 42, 
	42, 47, 10, 13, 32, 47, 9, 10, 
	0
]

class << self
	attr_accessor :_json_single_lengths
	private :_json_single_lengths, :_json_single_lengths=
end
self._json_single_lengths = [
	0, 5, 2, 1, 2, 1, 2, 1, 
	2, 1, 3
]

class << self
	attr_accessor :_json_range_lengths
	private :_json_range_lengths, :_json_range_lengths=
end
self._json_range_lengths = [
	0, 1, 0, 0, 0, 0, 0, 0, 
	0, 0, 1
]

class << self
	attr_accessor :_json_index_offsets
	private :_json_index_offsets, :_json_index_offsets=
end
self._json_index_offsets = [
	0, 0, 7, 10, 12, 15, 17, 20, 
	22, 25, 27
]

class << self
	attr_accessor :_json_indicies
	private :_json_indicies, :_json_indicies=
end
self._json_indicies = [
	0, 0, 2, 3, 4, 0, 1, 5, 
	6, 1, 7, 5, 7, 0, 5, 0, 
	6, 8, 9, 1, 10, 8, 10, 11, 
	8, 11, 9, 11, 11, 12, 11, 1, 
	0
]

class << self
	attr_accessor :_json_trans_targs
	private :_json_trans_targs, :_json_trans_targs=
end
self._json_trans_targs = [
	1, 0, 2, 10, 10, 3, 5, 4, 
	7, 9, 8, 10, 6
]

class << self
	attr_accessor :_json_trans_actions
	private :_json_trans_actions, :_json_trans_actions=
end
self._json_trans_actions = [
	0, 0, 0, 3, 1, 0, 0, 0, 
	0, 0, 0, 0, 0
]

class << self
	attr_accessor :json_start
end
self.json_start = 1;
class << self
	attr_accessor :json_first_final
end
self.json_first_final = 10;
class << self
	attr_accessor :json_error
end
self.json_error = 0;

class << self
	attr_accessor :json_en_main
end
self.json_en_main = 1;


# line 24 "json.rl"

        super
      end

      def parse
        pe = :ignored
        eof = :ignored
        p = self.p

        
# line 129 "json.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = json_start
end

# line 34 "json.rl"
        
# line 138 "json.rb"
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
	_keys = _json_key_offsets[cs]
	_trans = _json_index_offsets[cs]
	_klen = _json_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _json_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _json_trans_keys[_mid]
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
	  _klen = _json_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _json_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _json_trans_keys[_mid+1]
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
	_trans = _json_indicies[_trans]
	cs = _json_trans_targs[_trans]
	if _json_trans_actions[_trans] != 0
		_acts = _json_trans_actions[_trans]
		_nacts = _json_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _json_actions[_acts - 1]
when 0 then
# line 5 "json.rl"
		begin

       begin p = (( JsonObject.new(p: p, data: data, yielder: yielder).parse))-1; end

    		end
when 1 then
# line 9 "json.rl"
		begin

       begin p = (( JsonArray.new(p: p, data: data, yielder: yielder).parse))-1; end

    		end
# line 233 "json.rb"
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

# line 35 "json.rl"

        raise_unparseable p unless p == data.bytes_read
      ensure
        self.p = p
      end
    end
  end
end
