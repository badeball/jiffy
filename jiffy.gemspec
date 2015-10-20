require File.join(File.dirname(__FILE__), "lib", "jiffy", "version")

Gem::Specification.new do |s|
  s.name        = "jiffy"
  s.version     = Jiffy::VERSION
  s.license     = "MIT"

  s.summary     = "A streaming-based JSON formatter in Ruby."
  s.description = "Jiffy utilizes Ragel in order to parse and continuously format JSON data. This allows it to achieve a constant memory usage, independent of the input size."

  s.authors     = ["Jonas Amundsen"]
  s.email       = ["jonasba+gem@gmail.com"]
  s.homepage    = "https://github.com/badeball/jiffy"

  s.executable  = "jiffy"
  s.files       = Dir["LICENSE", "README.md", "lib/**/*"]
  s.test_files  = Dir["test/**/*.rb"]

  s.add_development_dependency("codeclimate-test-reporter")
  s.add_development_dependency("guard")
  s.add_development_dependency("guard-minitest")
  s.add_development_dependency("minitest")
  s.add_development_dependency("rake")
end
