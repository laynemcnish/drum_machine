require 'spec_helper'

RSpec.describe Song do
  let(:segment1) { Segment.new([HiHat.new(Array.new(8,0))], 128) }
  let(:segment2) { Segment.new([KickDrum.new(Array.new(8,0))], 128) }
  let(:segments) { [segment1, segment2] }
  let(:song) { Song.new(segments) }

  context "#initialize" do
    context "when song is initialized without valid segments" do
      let(:segments) { [Instrument.new(Array.new(8,0))] }

      it "raises an error" do
        expect{song}.to raise_error "Song must be initialized with an array of segments"
      end
    end
  end

  context "#play" do
    before do
      allow_any_instance_of(Segment).to receive(:play).and_return(nil)
    end

    it "iterates through the segments and calls play" do
      song.play
      expect(segment1).to have_received(:play).exactly(1).times
      expect(segment2).to have_received(:play).exactly(1).times
    end
  end
end
