class Rhythm
  attr_accessor :beats

  def initialize(beats)
    @beats = beats
    raise "The number of beats in a Rhythm must be divisible by 8" unless beats.count % 8 == 0
  end
end
