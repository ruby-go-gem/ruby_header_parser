# frozen_string_literal: true

require_relative "lib/ruby_header_parser/version"

Gem::Specification.new do |spec|
  spec.name = "ruby_header_parser"
  spec.version = RubyHeaderParser::VERSION
  spec.authors = ["sue445"]
  spec.email = ["sue445@sue445.net"]

  spec.summary = "Parser for ruby.h"
  spec.description = "Parser for ruby.h"
  spec.homepage = "https://github.com/ruby-go-gem/ruby_header_parser"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.3.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://ruby-go-gem.github.io/ruby_header_parser/"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile sig/non-gemify])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rbs", ">= 3.7.0"
  spec.add_development_dependency "rdoc"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "rspec-parameterized"
  spec.add_development_dependency "rspec-temp_dir"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop_auto_corrector"
  spec.add_development_dependency "steep"
  spec.add_development_dependency "yard"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
