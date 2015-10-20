require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs.push "test"
  t.test_files = FileList["test/*_test.rb"]
  t.verbose = true
end

desc "Compile every parser using Ragel"

task :compile do
  Dir.chdir "lib/jiffy/parsers/" do
    (Dir["*.rl"] - ["json_common.rl"]).each do |parser|
      system "ragel -R #{parser}"
    end
  end
end
