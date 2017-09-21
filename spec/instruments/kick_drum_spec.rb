require 'spec_helper'

RSpec.describe KickDrum do
  it { expect(described_class).to be < Instrument }

  context "#initialize" do
    subject { KickDrum.new(Rhythm.new(Array.new(8,0)))}

    it "initializes tone with a default kickdrum value" do
      expect(subject.tone).to eq([:kickdrum])
    end
  end
end
