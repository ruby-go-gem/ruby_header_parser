# -*- encoding: utf-8 -*-
# stub: rspec-temp_dir 1.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-temp_dir".freeze
  s.version = "1.1.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/sue445/rspec-temp_dir/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/sue445/rspec-temp_dir", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/sue445/rspec-temp_dir" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["sue445".freeze]
  s.date = "2021-11-20"
  s.description = "create automatically temporary directory at each examples".freeze
  s.email = ["sue445@sue445.net".freeze]
  s.homepage = "https://github.com/sue445/rspec-temp_dir".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.2.22".freeze
  s.summary = "create automatically temporary directory at each examples".freeze

  s.installed_by_version = "3.5.16".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rspec>.freeze, [">= 3.0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<coveralls>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0".freeze])
end
