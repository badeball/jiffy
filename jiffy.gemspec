require File.join(File.dirname(__FILE__), 'lib', 'jiffy', 'version')

Gem::Specification.new do |s|
  s.name        = 'jiffy'
  s.version     = Jiffy::VERSION
  s.license     = 'MIT'
  s.date        = '2014-12-14'

  s.summary     = 'A streaming-based JSON formatter in Ruby.'
  s.description = 'Jiffy utilizes Ragel in order to parse and continuously format JSON data. This allows it to achieve a constant memory usage, independent of the input size.'

  s.authors     = ['Jonas Amundsen']
  s.email       = ['jonasba+gem@gmail.com']
  s.homepage    = 'https://github.com/badeball/jiffy'

  s.executables = 'jiffy'

  s.files       = %w[
    bin/jiffy
    lib/jiffy/parsers/json.rb
    lib/jiffy/parsers/json.rl
    lib/jiffy/parsers/json_array.rb
    lib/jiffy/parsers/json_array.rl
    lib/jiffy/parsers/json_common.rl
    lib/jiffy/parsers/json_float.rb
    lib/jiffy/parsers/json_float.rl
    lib/jiffy/parsers/json_object.rb
    lib/jiffy/parsers/json_object.rl
    lib/jiffy/parsers/json_string.rb
    lib/jiffy/parsers/json_string.rl
    lib/jiffy/parsers/json_value.rb
    lib/jiffy/parsers/json_value.rl
    lib/jiffy/array_mimicking_io.rb
    lib/jiffy/json_outputter.rb
    lib/jiffy/version.rb
    lib/jiffy.rb
    test/jiffy_test.rb
    Gemfile
    Gemfile.lock
    jiffy.gemspec
    LICENSE
    README.md
  ]

  s.add_development_dependency('minitest')
  s.add_development_dependency('rake')
end
