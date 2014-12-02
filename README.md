json_better_formatter
=====================

[![Build Status](https://travis-ci.org/badeball/json_better_formatter.png)](https://travis-ci.org/badeball/json_better_formatter)

A streaming-based JSON formatter in Ruby that utilizes Ragel in order to parse
and continuously format JSON data. This allows it to achieve a somewhat
constant memory usage, independent of the input size. This is contrary to
libraries that translates JSON into its own internal AST or those which simply
uses JSON#pretty_generate.

## Installation

The utility can be installed using `gem`, but is also packaged for Arch Linux.

```
$ gem install json_better_formatter
```

It can be installed system-wide using the following options.

```
$ gem install --no-user-install -i "$(ruby -e'puts Gem.default_dir')" -n /usr/bin json_better_formatter
```

### Arch Linux

```
$ yaourt -Syua ruby-json_better_formatter
```

## Usage

```ruby
require 'json_better_formatter'

JsonBetterFormatter.new(in: 'some.json').format

# {
#   "menu": {
#     "id": "file",
#     "value": "File",
#     "popup": {
#       "menuitem": [
#         {
#           "value": "New",
#           "onclick": "CreateNewDoc()"
#         },
#         {
#           "value": "Open",
#           "onclick": "OpenDoc()"
#         },
#         {
#           "value": "Close",
#           "onclick": "CloseDoc()"
#         }
#       ]
#     }
#   }
# }
```

One can also chose to specify an IO object as input stream.

```ruby
JsonBetterFormatter.new(in: File.open('some.json')).format
```

It is also possible to specify an IO object as output stream.

```ruby
require 'stringio'

out = StringIO.new

JsonBetterFormatter.new(in: 'some.json', out: out).format
```

### Command line usage

With this tool, one can immediately get a sense of the JSON-structure of a file
of any size. The executable can read from a file specified as an argument or
read from standard input.

```
$ format-json incredibly-large.json | less
```

```
$ cat incredibly-large.json | format-json | less
```

## Compatibility

Tested against the following Ruby versions.

* 2.0.0
* 2.1.0
* 2.1.1
* 2.1.2
* 2.1.3
* 2.1.4
* 2.1.5

## Changelog

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
