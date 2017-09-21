Dir[File.join(File.dirname(__FILE__), "lib" , "**.rb")].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), "lib" , "instruments", "**.rb")].each { |f| require f }

# Create some rhythms
on_the_beat = Rhythm.new([1,0,0,0,1,0,0,0])
flam = Rhythm.new([0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0])
paradiddle = Rhythm.new([1,1,1,1,1,1,1,1])
threes = Rhythm.new([0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0])
evens = Rhythm.new([0,0,1,0,0,0,1,0])

# Create instruments with the rhythm of your choice
hihat = HiHat.new(paradiddle)
kickdrum = KickDrum.new(on_the_beat)
snare = SnareDrum.new(flam)

# Play instruments individually
# hihat.play
# kickdrum.play
# snare.play

# Combine instruments together into segments with a BPM
intro = Segment.new([hihat, kickdrum], 150)
four_on_the_floor = Segment.new([kickdrum, SnareDrum.new(threes), HiHat.new(evens)], 128)
chorus = Segment.new([kickdrum, snare, hihat], 200)
refrain = Segment.new([KickDrum.new(on_the_beat), SnareDrum.new(paradiddle), HiHat.new(flam)], 150)

# Play segments individually
# four_on_the_floor.play
# intro.play
# chorus.play
# refrain.play

# Combine segments together to play as a song
Song.new([intro, four_on_the_floor, chorus, refrain]).play
