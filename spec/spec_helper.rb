# frozen_string_literal: true

require "ruby_header_parser"

require "rspec/its"
require "rspec/parameterized"
require "rspec/temp_dir"

Dir["#{__dir__}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.filter_run_when_matching :focus

  config.include TestHelper

  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true
  end
end

# @return [String]
def default_config_file
  File.expand_path("../config/default.yml.erb", __dir__)
end
