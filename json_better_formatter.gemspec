require File.join(File.dirname(__FILE__), 'lib', 'json_better_formatter', 'version')

Gem::Specification.new do |s|
  s.name        = 'json_better_formatter'
  s.version     = JsonBetterFormatter::VERSION
  s.license     = 'MIT'
  s.date        = '2014-08-15'

  s.summary     = 'A streaming-based JSON formatter in Ruby.'
  s.description = 'JsonBetterFormatter utilizes Ragel in order to parse and continuously format JSON data. This allows it to achieve a constant memory usage, independent of the input size.'

  s.authors     = ['Jonas Amundsen']
  s.email       = ['jonasba+gem@gmail.com']
  s.homepage    = 'https://github.com/badeball/json_better_formatter'

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
    lib/json_better_formatter/parsers/json_object.rb
    lib/json_better_formatter/parsers/json_object.rl
    lib/json_better_formatter/parsers/json_string.rb
    lib/json_better_formatter/parsers/json_string.rl
    lib/json_better_formatter/parsers/json_value.rb
    lib/json_better_formatter/parsers/json_value.rl
    lib/json_better_formatter/array_mimicking_io.rb
    lib/json_better_formatter/json_outputter.rb
    lib/json_better_formatter/version.rb
    lib/json_better_formatter.rb
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
    test/positive-examples/float.json
    test/positive-examples/integer.json
    test/positive-examples/negative-float.json
    test/positive-examples/negative-integer.json
    test/positive-examples/null-value.json
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
    test/json_better_formatter_test.rb
    Gemfile
    Gemfile.lock
    json_better_formatter.gemspec
    LICENSE
    README.md
  ]

  s.add_development_dependency('minitest')
  s.add_development_dependency('rake')
end
