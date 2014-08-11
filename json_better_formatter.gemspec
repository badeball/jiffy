Gem::Specification.new do |s|
  s.name        = 'json_better_formatter'
  s.version     = '0.0.1'
  s.license     = 'MIT'
  s.date        = '2014-08-12'

  s.summary     = 'A streaming-based JSON formatter in Ruby.'
  s.description = 'JsonBetterFormatter utilizes Ragel in order to parse and continuously format JSON data. This allows it to achieve a constant memory usage, independent of the input size.'

  s.authors     = ['Jonas Amundsen']
  s.email       = ['jonasba+gem@gmail.com']

  s.executables = 'format-json'

  s.files       = %w[
    bin/format-json
    lib/json_better_formatter/parsers/json.rb
    lib/json_better_formatter/parsers/json.rl
    lib/json_better_formatter/parsers/json_array.rb
    lib/json_better_formatter/parsers/json_array.rl
    lib/json_better_formatter/parsers/json_common.rl
    lib/json_better_formatter/parsers/json_float.rb
    lib/json_better_formatter/parsers/json_float.rl
    lib/json_better_formatter/parsers/json_integer.rb
    lib/json_better_formatter/parsers/json_integer.rl
    lib/json_better_formatter/parsers/json_object.rb
    lib/json_better_formatter/parsers/json_object.rl
    lib/json_better_formatter/parsers/json_string.rb
    lib/json_better_formatter/parsers/json_string.rl
    lib/json_better_formatter/parsers/json_value.rb
    lib/json_better_formatter/parsers/json_value.rl
    lib/json_better_formatter/array_mimicking_io.rb
    lib/json_better_formatter/json_outputter.rb
    lib/json_better_formatter.rb
    test/examples/colors.json
    test/examples/facebook.json
    test/examples/flickr.json
    test/examples/youtube.json
    test/json_better_formatter_test.rb
    Gemfile
    Gemfile.lock
    json_better_formatter.gemspec
    LICENSE
    README.md
  ]

  s.add_development_dependency('minitest')
end
