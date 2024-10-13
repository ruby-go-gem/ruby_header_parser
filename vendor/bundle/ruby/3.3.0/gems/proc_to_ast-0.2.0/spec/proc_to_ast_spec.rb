require 'spec_helper'

describe Proc do
  describe "#to_ast" do
    it "return Parser::AST::Node" do
      ast = -> { 1 + 1 }.to_ast
      expect(ast).to be_a(Parser::AST::Node)
      expect(ast.type).to eq(:block)
    end

    context "proc variation" do
      it "converts Kernel#proc" do
        pr = proc { p 1 }

        expect(pr.to_ast).to be_a(AST::Node)
      end

      it "converts Proc.new" do
        pr = Proc.new do |b|
          puts b
        end

        expect(pr.to_ast).to be_a(AST::Node)
      end

      it "long proc" do
        pr = Proc.new do |b|
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
          p 1
        end

        expect(pr.to_ast).to be_a(AST::Node)
      end

      it "converts block passing method" do
        def receive_block(&block)
          block.to_ast
        end

        block_pass = receive_block do |n|
          puts n
          [1, 2, 3].map do |i|
            i * 2
          end
        end

        block_pass2 = receive_block { %w(a b c).map(&:upcase) }

        expect(block_pass).to be_a(AST::Node)
        expect(block_pass2).to be_a(AST::Node)
      end

      it "raise ProcToAst::MultiMatchError, when other block exists on same line " do
        _ = [1].map {|i| i * 2}; fuga = ->(a) {
          p a
        }

        expect{ fuga.to_ast }.to raise_error(ProcToAst::MultiMatchError)
      end

      it "inner array" do
        array = [
          1,
          -> { 2 },
          [
            -> {
              3
            },
          ],
          proc do |a|
            [
              a,
            ]
          end
        ]
        expect(array[1].to_ast).to be_a(AST::Node)
        expect(array[1].to_source).to eq("lambda {\n  2\n}")
        expect(array[2][0].to_source).to eq("lambda {\n  3\n}")
        expect(array[3].to_source).to eq("proc { |a,|\n  [a]\n}")
      end

      it "inner two dimension array" do
        array = [
          [1, 2, -> { 3 }],
          [4, 5, -> { 6 }]
        ]
        expect(array[0][2].to_ast).to be_a(AST::Node)
        expect(array[1][2].to_ast).to be_a(AST::Node)
      end

      it "inner hash" do
        hash_oneline = {a: -> { 1 }}
        expect(hash_oneline[:a].to_ast).to be_a(AST::Node)
        expect(hash_oneline[:a].to_source).to eq("lambda {\n  1\n}")
      end

      it "inner multiline hash" do
        hash = {
          a: -> { 1 },
          :b => -> { 2 },
          c: -> {
            3
          },
          d: -> { 4 }
        }
        expect(hash[:a].to_ast).to be_a(AST::Node)
        expect(hash[:a].to_source).to eq("lambda {\n  1\n}")
        expect(hash[:b].to_ast).to be_a(AST::Node)
        expect(hash[:b].to_source).to eq("lambda {\n  2\n}")
        expect(hash[:c].to_ast).to be_a(AST::Node)
        expect(hash[:c].to_source).to eq("lambda {\n  3\n}")
        expect(hash[:d].to_ast).to be_a(AST::Node)
        expect(hash[:d].to_source).to eq("lambda {\n  4\n}")
      end

      it "inner another hash" do
        hash = {
          a: 1, :b => -> { 2 },
        }

        expect(hash[:b].to_ast).to be_a(AST::Node)
        expect(hash[:b].to_source).to eq("lambda {\n  2\n}")
      end
    end
  end

  describe "#to_source" do
    it "return source code string" do
      fuga = ->(a) {
        p a
      }

      expect(fuga.to_source).to eq("lambda { |a,|\n  p(a)\n}")
      expect(fuga.to_source(highlight: true)).to eq("\e[01mlambda\e[00m\e[38;5;230m \e[39m\e[38;5;87m{\e[39m\e[38;5;230m \e[39m\e[38;5;87;01m|\e[39;00m\e[38;5;230ma\e[39m\e[38;5;87m,\e[39m\e[38;5;87;01m|\e[39;00m\e[38;5;230m\e[39m\n\e[38;5;230m  \e[39m\e[01mp\e[00m\e[38;5;87m(\e[39m\e[38;5;230ma\e[39m\e[38;5;87m)\e[39m\e[38;5;230m\e[39m\n\e[38;5;230m\e[39m\e[38;5;87m}\e[39m")
    end

    it "charset is UTF-8" do
      fuga = ->(a) {
        p a
      }
      expect(fuga.to_source.encoding).to eq(Encoding::UTF_8)
    end

    it "can handle multibyte characters" do
      pr = ->(a) { a + "ほげほげ" }
      expect(pr.to_source).to eq("lambda { |a,|\n  a + \"\\xE3\\x81\\xBB\\xE3\\x81\\x92\\xE3\\x81\\xBB\\xE3\\x81\\x92\"\n}")
    end
  end

  describe "#to_raw_source" do
    it "return original source code" do
      pr = ->(a) { a + 1 }

      expect(pr.to_raw_source).to eq("->(a) { a + 1 }")
    end

    it "charset is UTF-8" do
      pr = ->(a) { a + 1 }
      expect(pr.to_raw_source.encoding).to eq(Encoding::UTF_8)
    end

    it "can handle multibyte characters" do
      pr = ->(a) { a + "ほげほげ" }
      expect(pr.to_raw_source).to eq("->(a) { a + \"ほげほげ\" }")
      expect(pr.to_raw_source(highlight: true)).to eq("\e[38;5;87;01m->\e[39;00m\e[38;5;87m(\e[39m\e[38;5;230ma\e[39m\e[38;5;87m)\e[39m\e[38;5;230m \e[39m\e[38;5;87m{\e[39m\e[38;5;230m \e[39m\e[38;5;230ma\e[39m\e[38;5;230m \e[39m\e[38;5;87;01m+\e[39;00m\e[38;5;230m \e[39m\e[38;5;229;01m\"ほげほげ\"\e[39;00m\e[38;5;230m \e[39m\e[38;5;87m}\e[39m")
    end
  end
end
