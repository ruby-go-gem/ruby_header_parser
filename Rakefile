# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

namespace :rbs do
  desc "`rbs collection install` and `git commit`"
  task :install do
    sh "rbs collection install"
    sh "git add rbs_collection.lock.yaml"
    sh "git commit -m 'rbs collection install' || true"
  end
end

desc "Check rbs"
task :rbs do
  sh "rbs validate"
  sh "steep check"
end

desc "Run all development tasks"
task dev_all: %i[spec rubocop rbs]

task default: :dev_all
