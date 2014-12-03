require File.join(File.dirname(__FILE__), 'lib', 'jiffy', 'version')

Gem::Specification.new do |s|
  s.name        = 'jiffy'
  s.version     = Jiffy::VERSION
  s.license     = 'MIT'
  s.date        = '2014-08-15'

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
    lib/jiffy/json_outputter.rb
    lib/jiffy/version.rb
    lib/jiffy.rb
    test/negative-examples/hexadecimal.json
    test/negative-examples/infinity-value.json
    test/negative-examples/leading-comma.json
    test/negative-examples/leading-zero.json
    test/negative-examples/line-break.json
    test/negative-examples/missing-colon.json
    test/negative-examples/nan-value,json
    test/negative-examples/positive-float.json
    test/negative-examples/positive-integer.json
    test/negative-examples/single-quote.json
    test/negative-examples/string-as-root.json
    test/negative-examples/tab-character.json
    test/negative-examples/trailing-array-seperator.json
    test/negative-examples/trailing-object-seperator.json
    test/negative-examples/true-as-root.json
    test/negative-examples/unclosed-array.json
    test/negative-examples/unclosed-object.json
    test/positive-examples/array-as-root.json
    test/positive-examples/array-nested-inside-array.json
    test/positive-examples/array-nested-inside-object.json
    test/positive-examples/false-value.json
    test/positive-examples/null-value.json
    test/positive-examples/number-1.json
    test/positive-examples/number-10.json
    test/positive-examples/number-11.json
    test/positive-examples/number-12.json
    test/positive-examples/number-13.json
    test/positive-examples/number-14.json
    test/positive-examples/number-15.json
    test/positive-examples/number-16.json
    test/positive-examples/number-17.json
    test/positive-examples/number-18.json
    test/positive-examples/number-19.json
    test/positive-examples/number-2.json
    test/positive-examples/number-20.json
    test/positive-examples/number-3.json
    test/positive-examples/number-4.json
    test/positive-examples/number-5.json
    test/positive-examples/number-6.json
    test/positive-examples/number-7.json
    test/positive-examples/number-8.json
    test/positive-examples/number-9.json
    test/positive-examples/object-as-root.json
    test/positive-examples/object-nested-inside-array.json
    test/positive-examples/object-nested-inside-object.json
    test/positive-examples/seperated-array-values.json
    test/positive-examples/seperated-object-properties.json
    test/positive-examples/string-backspace.json
    test/positive-examples/string-carriage-return.json
    test/positive-examples/string-formfeed.json
    test/positive-examples/string-horizontal-tab.json
    test/positive-examples/string-newline.json
    test/positive-examples/string-quotation.json
    test/positive-examples/string-reverse-solidus.json
    test/positive-examples/string-solidus.json
    test/positive-examples/string-trivial.json
    test/positive-examples/string-unicode.json
    test/positive-examples/true-value.json
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
