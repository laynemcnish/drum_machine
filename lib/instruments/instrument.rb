require_relative '../player_utilities'

class Instrument
  include PlayerUtilities

  attr_reader :rhythm
  attr_reader :tone

  def initialize(tone = :kickdrum, rhythm)
    @tone = tone.is_a?(Symbol) ? [tone] : tone
    @rhythm = rhythm.is_a?(Array) ? Rhythm.new(rhythm) : rhythm
    validate_rhythm
    validate_tone
  end

  def play
    play_each_beat(test_beats)
  end

  private

  def test_beats
    @rhythm.beats.each_with_object([]) do |beat, ary|
      sound = beat == 1 ? [tone] : []
      ary << sound
    end
  end

  def validate_rhythm
    raise "An instrument must be initialized with a Rhythm or array" unless @rhythm.is_a?(Rhythm)
  end

  def validate_tone
    if tone.nil?
      raise "An instrument must be initialized a tone"
    elsif SOUNDS[tone].nil?
      raise "An instrument must be initialized with a valid tone"
    end
  end
end
