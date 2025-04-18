# frozen_string_literal: true

RSpec.describe RubyHeaderParser::Config do
  let(:config) { RubyHeaderParser::Config.new(default_config_file) }

  describe "#function_arg_pointer_hint" do
    subject { config.function_arg_pointer_hint(function_name:, pos:) }

    context "found in config/default.yml.erb" do
      let(:function_name) { "rb_funcallv" }
      let(:pos) { 4 }

      it { should eq :array }
    end

    context "not found in config/default.yml.erb" do
      let(:function_name) { "rb_funcallv" }
      let(:pos) { 5 }

      it { should eq :ref }
    end
  end

  describe "#function_self_pointer_hint" do
    subject { config.function_self_pointer_hint(function_name) }

    context "found in default.yml.erb" do
      let(:function_name) { "RSTRING_PTR" }

      it { should eq :raw }
    end

    context "not found in config/default.yml.erb" do
      let(:function_name) { "rb_class2name" }

      it { should eq :ref }
    end
  end

  describe "#should_generate_function?" do
    subject { config.should_generate_function?(function_name) }

    context "rb function (denied)" do
      let(:function_name) { "rb_check_safe_str" }

      it { should eq false }
    end

    context "rb function (allowed)" do
      let(:function_name) { "rb_define_class" }

      it { should eq true }
    end

    context "no rb function" do
      let(:function_name) { "sprintf" }

      it { should eq false }
    end
  end

  describe "#should_generate_struct?" do
    subject { config.should_generate_struct?(struct_name) }

    context "rb struct" do
      let(:struct_name) { "rb_random_struct" }

      it { should eq true }
    end

    context "non rb struct" do
      let(:struct_name) { "fuga" }

      it { should eq false }
    end
  end

  describe "#should_generate_type?" do
    subject { config.should_generate_type?(type_name) }

    context "rb type" do
      let(:type_name) { "rb_data_type_t" }

      it { should eq true }
    end

    context "VALUE" do
      let(:type_name) { "VALUE" }

      it { should eq true }
    end

    context "unknown" do
      let(:type_name) { "unknown" }

      it { should eq false }
    end
  end

  describe "#should_generate_enum?" do
    subject { config.should_generate_enum?(enum_name) }

    context "ruby_value_type" do
      let(:enum_name) { "ruby_value_type" }

      it { should eq true }
    end

    context "unknown" do
      let(:enum_name) { "unknown" }

      it { should eq false }
    end
  end
end
