require 'spec_helper'

RSpec.describe SnareDrum do
  it { expect(described_class).to be < Instrument }

  context "#initialize" do
    subject { SnareDrum.new(Rhythm.new(Array.new(8,0)))}

    it "initializes tone with a default snaredrum value" do
      expect(subject.tone).to eq([:snaredrum])
    end
  end
end
