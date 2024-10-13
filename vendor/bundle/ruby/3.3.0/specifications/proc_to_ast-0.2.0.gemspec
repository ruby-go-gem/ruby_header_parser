# -*- encoding: utf-8 -*-
# stub: proc_to_ast 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "proc_to_ast".freeze
  s.version = "0.2.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["joker1007".freeze]
  s.date = "2024-05-04"
  s.description = "Add #to_ast method to Proc. #to_ast converts Proc object to AST::Node.".freeze
  s.email = ["kakyoin.hierophant@gmail.com".freeze]
  s.homepage = "https://github.com/joker1007/proc_to_ast".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.5.3".freeze
  s.summary = "Convert Proc object to AST::Node".freeze

  s.installed_by_version = "3.5.16".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<parser>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<unparser>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<rouge>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, [">= 1.5".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0".freeze])
end
