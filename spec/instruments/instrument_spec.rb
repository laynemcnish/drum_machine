require 'spec_helper'

RSpec.describe Instrument do
  let(:tone) { [:hihat] }
  let(:rhythm) { Array.new(8,0) }
  let(:instrument) { Instrument.new(tone, rhythm) }

  context "#initialize" do
    subject { instrument }

    it "sets an attr_accessor on rhythm" do
      expect(subject.rhythm).to be_a(Rhythm)
    end

    it "sets an attr_accessor on tone" do
      expect(subject.tone).to eq([:hihat])
    end

    it "initializes tone with a default value" do
      expect(Instrument.new(rhythm).tone).to eq([:kickdrum])
    end

    it "validates that rhythm" do
      expect{ Instrument.new({}) }.to raise_error "An instrument must be initialized with a Rhythm or array"
      expect{ Instrument.new(Array.new(8,0)) }.not_to raise_error
      expect{ Instrument.new(Rhythm.new(Array.new(8,0))) }.not_to raise_error
    end

    it "validates that a tone is present" do
      expect{ Instrument.new(nil, rhythm) }.to raise_error "An instrument must be initialized a tone"
    end

    it "validates that there is a defined sound for the tone" do
      expect{ Instrument.new([:blah], rhythm) }.to raise_error "An instrument must be initialized with a valid tone"
    end
  end

  context "#play" do
    subject { instrument.play }

    before do
      allow_any_instance_of(PlayerUtilities).to receive(:clear_screen).and_return(nil)
      allow_any_instance_of(PlayerUtilities).to receive(:play_each_beat).and_return(nil)
    end

    it "calls play_each_beat with a test beats" do
      subject
      expect(instrument).to have_received(:play_each_beat).with(an_instance_of(Array))
    end
  end
end
