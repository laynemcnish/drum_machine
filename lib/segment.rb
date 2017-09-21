require_relative './player_utilities'

class Segment
  include PlayerUtilities

  attr_reader :merged_sounds, :bpm

  def initialize(instruments, bpm)
    @instruments = instruments
    @bpm = bpm
  end

  def play
    play_each_beat(merged_sounds, @bpm)
  end

  private

  def merged_sounds
    max_repeated_rhythm = @instruments.max_by {|i| i.rhythm.beats.count }.rhythm.beats.count
    @instruments.each_with_object([]) do |instrument, sounds_to_play|
      repeats = max_repeated_rhythm / instrument.rhythm.beats.count
      beats = instrument.rhythm.beats * repeats
      beats.each_with_index do |beat, i|
        sounds_to_play[i] ||= []
        sounds_to_play[i] << instrument.tone if beat == 1
      end
    end
  end
end
