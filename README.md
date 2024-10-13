# RubyHeaderParser
Parser for `ruby.h`

[![test](https://github.com/sue445/ruby_header_parser/actions/workflows/test.yml/badge.svg)](https://github.com/sue445/ruby_header_parser/actions/workflows/test.yml)

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add ruby_header_parser
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install ruby_header_parser
```

## Requirements
Following is required in addition to Ruby.

### ctags
macOS

```bash
brew install universal-ctags
```

Ubuntu

```bash
apt-get install -y universal-ctags
```

## Usage
```ruby
require "ruby_header_parser"

parser = RubyHeaderParser::Parser.new

function_definitions = parser.extract_function_definitions
static_inline_function_definitions = parser.extract_static_inline_function_definitions
struct_definitions = parser.extract_struct_definitions
type_definitions = parser.extract_type_definitions
enum_definitions = parser.extract_enum_definitions
```

See below for details.

https://sue445.github.io/ruby_header_parser/RubyHeaderParser/Parser.html

See [CONFIG.md](CONFIG.md) for config file details

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sue445/ruby_header_parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
