require 'spec_helper'

RSpec.describe PlayerUtilities do
  let(:player_utilities) { Object.new.extend(PlayerUtilities) }

  context "#clear_screen" do
    it "calls the clear screen character" do
      expect { player_utilities.clear_screen }.to output("\033[2J\n").to_stdout
    end
  end

  context "#space_between_beats" do
    it "divides the bpm into 60 / 2 to get the eighth note beat time" do
      expect(player_utilities.space_between_beats(60)).to eq(0.5)
    end

    it "defaults to 128" do
      expect(player_utilities.space_between_beats).to eq(0.234375)
    end
  end

  context "#play_each_beat" do
    before do
      allow_any_instance_of(PlayerUtilities).to receive(:say_noise)
    end

    subject { player_utilities.play_each_beat([[:highhat], [:highhat]]) }

    it "calls prints each beat" do
      expect { subject }.to output("highhat\n\e[2J\nhighhat\n\e[2J\n").to_stdout
    end
  end
end
