### Florence and the Drum Machine!

Florence allows you to compose some sweet beats with a variety of instruments and rhythms.

It allows users the ability to play:
- eighth note rhythms defined by the user
- individual instruments with different rhythms
- multiple instruments combined together as a segment with a tempo
- multiple segments composed together to form a full song

![Drum Machine Example](https://i.imgur.com/fFmb2Bw.gif)

### How to install
If you do not have ruby installed on your machine, you can use the installation method of your choice or follow the instructions listed [here](https://www.ruby-lang.org/en/documentation/installation/).

`$ gem install bundler`

`$ bundle install`

### How to run Florence
If you have ruby installed, run `ruby example.rb`

The example file lists different examples of how Florence can be used which can be un-commented or edited to allow you to play around with the different options.

### How to change what it is playing

### How to run tests
To run the tests:
`$ rspec spec`

### Known limitations
Florence assumes that the drummer looks like:

![octocat](https://avatars3.githubusercontent.com/u/583231)

Thus, it does not validate that the drummer only plays what is physically possible with 2 hands and feet.

Florence is built with a set list of sounds to get started with but in the future, more sounds and player options could easily be added.  For the purposes of this project, I chose to not try to implement a layering library to give the ability to play mp3s for multiple instruments at once and chose to stick with system say given a list of predetermined sounds (which I think gives it a pretty fun beatboxing vibe).

The tempo can only go as high as 200BPM due to the constraints of macOS say's speed.  In order to play notes faster, Ellen must be able to say them faster.

Florence only plays with eighth note precision and can not play sustained or multi-strike notes such as rolls.
