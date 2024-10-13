# -*- encoding: utf-8 -*-
# stub: rubocop_auto_corrector 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop_auto_corrector".freeze
  s.version = "0.5.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/sue445/rubocop_auto_corrector/blob/master/CHANGELOG.md", "documentation_uri" => "https://sue445.github.io/rubocop_auto_corrector/", "homepage_uri" => "https://github.com/sue445/rubocop_auto_corrector", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/sue445/rubocop_auto_corrector" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["sue445".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-06-14"
  s.description = "Run `rubocop --autocorrect && git commit` with each cop.".freeze
  s.email = ["sue445@sue445.net".freeze]
  s.executables = ["rubocop_auto_corrector".freeze]
  s.files = ["exe/rubocop_auto_corrector".freeze]
  s.homepage = "https://github.com/sue445/rubocop_auto_corrector".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.5.9".freeze
  s.summary = "Run `rubocop --autocorrect && git commit` with each cop.".freeze

  s.installed_by_version = "3.5.16".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rubocop>.freeze, [">= 1.30.0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, [">= 1.17".freeze])
  s.add_development_dependency(%q<coveralls_reborn>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<rspec-parameterized>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec-temp_dir>.freeze, [">= 1.1.0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 1.23.0".freeze])
  s.add_development_dependency(%q<rubocop-rspec>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["< 0.18.0".freeze])
  s.add_development_dependency(%q<unparser>.freeze, [">= 0.4.5".freeze])
  s.add_development_dependency(%q<yard>.freeze, [">= 0".freeze])
end
