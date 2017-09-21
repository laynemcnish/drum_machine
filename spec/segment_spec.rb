require 'spec_helper'

RSpec.describe Segment do
  let(:rhythm) { Rhythm.new(Array.new(8,0))}
  let(:rhythm2) { Rhythm.new(Array.new(16,0)) }
  let(:hihat) { HiHat.new(rhythm) }
  let(:snaredrum) { SnareDrum.new(rhythm2) }
  let(:instruments) { [hihat, snaredrum] }
  let(:segment) { Segment.new(instruments, 128) }

  context "#initialize" do
    it "sets an attr_accessor on bpm" do
      expect(segment.bpm).to eq(128)
    end
  end

  context "#play" do
    subject { segment.play }

    before do
      allow_any_instance_of(PlayerUtilities).to receive(:clear_screen).and_return(nil)
      allow_any_instance_of(PlayerUtilities).to receive(:play_each_beat).and_return(nil)
    end

    it "equalizes the rhythms across all the instruments" do
      subject
      expect(segment).to have_received(:play_each_beat).with(Array.new(16,[]), 128)
    end

    it "resets instruments back to their original state afterwards" do
      subject
      expect(hihat.rhythm).to eq(rhythm)
      expect(hihat.rhythm.beats.count).to eq(8)
    end

    it "calls #play_each_beat with the merged sounds and bpm" do
      subject
      expect(segment).to have_received(:play_each_beat).with(an_instance_of(Array), 128)
    end
  end
end
