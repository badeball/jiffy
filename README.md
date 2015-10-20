Jiffy
=====

[![Build Status](https://travis-ci.org/badeball/jiffy.png)](https://travis-ci.org/badeball/jiffy)
[![Code Climate](https://codeclimate.com/github/badeball/jiffy/badges/gpa.svg)](https://codeclimate.com/github/badeball/jiffy)
[![Test Coverage](https://codeclimate.com/github/badeball/jiffy/badges/coverage.svg)](https://codeclimate.com/github/badeball/jiffy)

A streaming-based JSON formatter in Ruby that utilizes Ragel in order to parse
and continuously format JSON data. This allows it to achieve a somewhat
constant memory usage, independent of the input size. This is contrary to
libraries that translates JSON into its own internal AST or those which simply
uses JSON#pretty_generate.

## Installation

The utility can be installed using `gem`, but is also packaged for Arch Linux.

```
$ gem install jiffy
```

It can be installed system-wide using the following options.

```
$ gem install --no-user-install -i "$(ruby -e'puts Gem.default_dir')" -n /usr/local/bin jiffy
```

### Arch Linux

```
$ yaourt -S ruby-jiffy
```

## Usage

```ruby
require "jiffy"

Jiffy.new(in: StringIO.new("[false, true, null]")).tokenize.to_a # => [:begin_array, :false, :value_separator, :true, :value_separator, :null, :end_array]
```

Any IO object that responds to `readpartial` can be used as an input source.

```ruby
Jiffy.new(in: File.open("some.json"))
```

One can also chose to specify a file path instead of an IO object as input source.

```ruby
Jiffy.new(in: "some.json")
```

`Jiffy#format` can be used to format the input source instead of just tokenizing it.

```ruby
require "stringio"

i = StringIO.new("[false, true, null]")
o = StringIO.new
outputter = Jiffy::Outputters::Json.new(out: o)

Jiffy.new(in: i).format(outputter: outputter)

o.string # => "[\n  false,\n  true,\n  null\n]"
```

### Command line usage

With this tool, one can immediately get a sense of the JSON-structure of a file
of any size. The executable can read from a file specified as an argument or
read from standard input.

```
$ jiffy incredibly-large.json | less
```

```
$ cat incredibly-large.json | jiffy | less
```

## Compatibility

Tested against the following Ruby versions.

* 1.9.3
* 2.0.0
* 2.1.0-2.1.7
* 2.2.0-2.2.3

## Changelog

### 1.1.1

* Fixed a bug in outputting of escape sequences.

### 1.1.0

* Fixing an issue where the first digit in numbers was tokenized to :char.
* Add numerous extra tokens to represent things that was previously emitted as :chars.
* Add an option to colorize output.
* Add an option to output Ruby objects instead of Json.
* Different refactorings, which unfortunately breaks API compatibility.

### 1.0.4

* SIGPIPE is handled by exiting (with exit code 141).

### 1.0.3

* Fixed an issue with the gemspec.

### 1.0.2

* Missing read permissions is now handled properly.
* Non-existing file as argument is now handled properly.
* Directory as argument is now handled properly.
* Output now always ends with a newline.
* #read is switched out in favor of #readpartial.

### 1.0.1

* The application is renamed Jiffy.
* The executable may now read from standard input.
* SIGTERM and SIGINT is now handled properly and a ruby stacktrace is not shown.

### 1.0.0

* ArgumentError is raised instead of custom error classes for each argument.
* Fixing an issue where unparseable values would raise NameError and not UnparseableError.
* Unexpected end of input is now properly handled and an UnparseableError is raised.
* Removing parsing of NaN and Infinity.

### 0.0.6

* Correcting an issue where a file was missing from the gemspec.

### 0.0.5

* Adding a command line option to show the version number.

### 0.0.4

* Fixing an issue where using an IO object as input source would always raise
  an error.

### 0.0.3

* Added install instructions to the README.
* #2: Added command line help text to the executable.

### 0.0.2

* #1: The executable now handles closed pipes.

### 0.0.1

* Initial work on the project.
