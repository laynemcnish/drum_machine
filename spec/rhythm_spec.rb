require 'spec_helper'

RSpec.describe Rhythm do
  context "#initialize" do
    let(:beats) { Array.new(8,0) }
    subject { Rhythm.new(beats) }

    it "sets an attr_accessor on beats" do
      expect(subject.beats).to eq(beats)
    end

    context "when the beats aren't divisible by 8" do
      let(:beats) { Array.new(7,0) }

      it "raises an error if the beats aren't divisible by 8" do
        expect{ subject }.to raise_error "The number of beats in a Rhythm must be divisible by 8"
      end
    end
  end
end
