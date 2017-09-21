require 'spec_helper'

RSpec.describe HiHat do
  it { expect(described_class).to be < Instrument }

  context "#initialize" do
    subject { HiHat.new(Rhythm.new(Array.new(8,0))) }

    it "initializes tone with a default highhat value" do
      expect(subject.tone).to eq([:hihat])
    end
  end
end
