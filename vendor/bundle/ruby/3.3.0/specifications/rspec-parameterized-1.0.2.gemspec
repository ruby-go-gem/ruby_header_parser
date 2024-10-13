# -*- encoding: utf-8 -*-
# stub: rspec-parameterized 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-parameterized".freeze
  s.version = "1.0.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["tomykaira".freeze]
  s.date = "2024-04-28"
  s.description = "RSpec::Parameterized supports simple parameterized test syntax in rspec.".freeze
  s.email = ["tomykaira@gmail.com".freeze]
  s.homepage = "https://github.com/tomykaira/rspec-parameterized".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.3".freeze
  s.summary = "RSpec::Parameterized supports simple parameterized test syntax in rspec. I was inspired by [udzura's mock](https://gist.github.com/1881139).".freeze

  s.installed_by_version = "3.5.16".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rspec-parameterized-core>.freeze, ["< 2".freeze])
  s.add_runtime_dependency(%q<rspec-parameterized-table_syntax>.freeze, ["< 2".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 12.0.0".freeze])
end
