json_better_formatter
=====================

[![Build Status](https://travis-ci.org/badeball/json_better_formatter.png)](https://travis-ci.org/badeball/json_better_formatter)

A streaming-based JSON formatter in Ruby that utilizes Ragel in order to parse
and continuously format JSON data. This allows it to achieve a somewhat
constant memory usage, independent of the input size. This is contrary to
libraries that translates JSON into its own internal AST or those which simply
uses JSON#pretty_generate.

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
of any size.

```
$ format-json incredibly-large.json | less
```

## Compatibility

Tested against the following Ruby versions.

* 2.0.0
* 2.1.0
* 2.1.1
* 2.1.2
