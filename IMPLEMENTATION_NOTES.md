### Requirements

A song contains multiple patterns being sequenced for different samples.
  - The drum machine can handle 8th note rhythms of any pattern
    with 1 of each instrument playing at a time up to 200 BPM

A song plays at a given tempo (AKA bpm), the tempo does not need to be able change while the song plays.
  - A song can play up to 200 BPM and is able to change tempos with each section.

For this exercise, you are expected to implement 3 patterns for the following sounds/samples: kick, snare and hihat (you can use the example pattern or come up with your own).
  - Kick, snare and hihat are all implemented and adding new instruments would be simple.

The time signature is expected to be 4/4 (if you don't know what that is, don't worry and ignore this instruction).
  - The time signature is 4/4 but since I did not implement the ability to stress the beat,
    the time signature is not really pertinent to my solution.
  - However, if I was to add emphasis to various beats, one easy way to do it would be to changing the inputs to being 0 for nothing then all subsequent numbers could represent that the instrument was playing and at what volume to play it at.  This would give the ability to add emphasis, crescendos and decrescendos.

The pattern is expected to be 8 steps or more.
  - I allow a minimum of 8 steps.  Everything after that must be divisible by 8 so that the sections can be put together.

The output isn't expected to be in sync with the tempo/BPM (bonus points if you manage to do it).
  - The output does keep time (for the most part).  It is limited by the abilities of system say, namely how quickly system say can output a word.  I tried to keep the words short but there was only so much I could do.  
  - For future iterations, I would consider writing a queuing system that would create a new thread for each beat so that once it came time for other beats to begin, they did not have to wait for the previous beats to complete before executing.  This would be messy if I could not ensure the all beats only outputted sound within their provided length of time.
  - In my PlayerUtilities#play_each_beat, I wrote it with the expectation that each sound output would take less than one tick of the clock.  It would calculate how much time was available within the full beat then would mark the current time, execute the sound output, mark the current time again, subtract how much time had passed from the beat's time allowance and sleep every millisecond until the beat had used up it's allotted time.
  - This is the one piece of code that I did not write a complete spec for.  Honestly, it was difficult to mock out and I didn't want to linger too long so I gave it up for the moment.  If I were to write the test, I would stub out the system say to be a sleep for 1 second with the beat's time mocked out at 2 seconds.  Then I could test that sleep was called a certain amount of times while method was executing.

### Extra mile

Try mix and matching patterns of different durations (8, 16, 32 steps), note that if you have 2 patterns, one 8 and one 16, the 8 should play twice while the 16 plays once.
  - When you add multiple instruments together into a segment, it will take the length of the longest rhythm provided and multiply the rest of the instruments rhythms until all are the same length.  This makes the instruments and rhythms a bit more flexible and reusable so you don't have to always ensure that you write rhythms of the same length.

Add support for velocity (the amplitude/volume of a note).
  - Spoke about this above.
Try to output sound (OS X has the say command, windows as ptts, also most language have bindings for portaudio
  - I used system say to make a kind of annoying beat box machine.

### Splice Evaluation

If you are given this exercise as a code challenge, we are going to discuss a few things with you. In order to help you prepare, here is a list of various specific parts and general aspects of programming we are interested in discussing:

How much time did you spend on the exercise, what parts took longer?
  - I took about 3 hours to write this implementation.

What were the hard parts, what parts did you enjoy most?
  - The hardest part was trying to get system say to cooperate with the BPM.  This was the hardest part to test, as well.
  - Also, trying to come up with beat-boxing noises for system say to use was difficult.  Like what does a kick drum plus a high hat sound like when they're playing at the same time.
  - For this reason, I left an option open when initializing an instrument to provide a different tone.  I thought that making the design clear that this was meant to be configurable would make it easier to implement in the future.  I envisioned that audio clips would replace the system say sounds so that more realistic noises could be combined.  You could either have pre-recorded combination sounds like I mocked out for system say or you could use uncompressed files to combine them on your own.  I didn't want to get into the business of figuring out how to merge audio files together for this code challenge but I think it would be an interesting next step for this program.

### Data modeling
How did you model the concepts of songs and tracks/patterns, can you explain why?
  - I chose to write my program keeping in mind how real instruments would be played.  You can play an instrument by itself, in conjunction with other instruments as a segment and you can combine multiple segments together into a full song.  I also chose to make rhythms reusable as well since it would be convenient to be able to re-use them amongst different instruments.

### Simplicity vs Flexibility -
How flexible is your solution?
  - Instruments can be played separately or together in any 8th note rhythm as long as a full measure of notes is defined.  
  - Instruments can be chained together into segments.
  - Segments can be chained together into a song.
  - Each component is chain-able and reusable including instruments, rhythms, and segments.

Can a user define patterns of different lengths?
  - Users can define 8th note patterns of any length divisible by 8 which can be combined in segments with other instruments with varying lengths divisible by 8.

Can they play at the same time?
  - Instruments can play at the same time but only one of each instrument can sound simultaneously since I had no idea how to beat box two of the same instrument at the same time.  Perhaps, you could increase the volume with each additional instrument.

Can the patterns be changed in real time?
  - While patterns can not change in real time, the patterns and BPM can change for each segment.  As it's written, it executes from start to finish until the rhythm or chained sets of rhythms completes.
  - One hacky way of allowing it to change in realtime would be to run the ruby script repeatedly sourcing the example.rb file between each repeat.  Then it could pick up any changes before executing the file again.
  for run in {1..10}; do source example.rb; ruby example.rb; done

Can the velocity be set?
  - The velocity can be set up to 200 BPM.  The reason it can't currently go any faster than this is because the system can only speak so fast.  Anything faster and the words the system is outputting will take longer than the beat has available.  Also, with the Ellen voice, it can only go up to a speed of 720.  You could easily switch it to the default voice to squeeze out some extra speed but it doesn't sound quite as nice as Ellen's voice.
  - Another option would be to replace the beatboxing noises with sound files.  It would be cool to implement each segment with a combination of uncompressed sound files so that you could mix them together before executing.  This seem beyond the scope of the current iteration but cool be cool for the future.

Is your code tested? Why/why not? How would you test it (or better)?
  - For the most part, the different components are unit tested.  The part that is the least tested is the player utilities, specifically the wait_for_next_beat, play_each_beat and say_noise methods.  Testing out the timing was difficult so I decided my time was better spent elsewhere for the moment.
