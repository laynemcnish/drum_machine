require_relative 'player_utilities'

class Song
  include PlayerUtilities

  def initialize(segments)
    @segments = segments
    validate_segments
  end

  def play
    @segments.map(&:play)
  end

  private

  def validate_segments
    unless @segments.is_a?(Array) && @segments.all? {|s| s.is_a?(Segment) }
      raise "Song must be initialized with an array of segments"
    end
  end
end
