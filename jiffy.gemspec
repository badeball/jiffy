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

  s.add_development_dependency("codeclimate-test-reporter", "0.4.7")
  s.add_development_dependency("guard", "2.13.0")
  s.add_development_dependency("guard-minitest", "2.4.4")
  s.add_development_dependency("minitest", "5.3.3")
  s.add_development_dependency("rake", "10.3.2")
end
