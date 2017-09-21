module PlayerUtilities
  SOUNDS = {
    [:hihat] => "tiss",
    [:kickdrum] => "buh",
    [:snaredrum] => "kayt",
    [:hihat, :kickdrum] => "boom",
    [:kickdrum, :snaredrum] => "bap",
    [:hihat, :snaredrum] => "tat",
    [:hihat, :kickdrum, :snaredrum] => "crash"
  }

  def clear_screen
    puts "\033[2J"
  end

  def space_between_beats(bpm = 128)
    (60.0 / bpm) / 2
  end

  def wait_for_next_beat(seconds_to_wait, last_tick)
    loop do
      sleep 0.0001
      if Time.now - last_tick >= seconds_to_wait
        break
      end
    end
  end

  def play_each_beat(beats, bpm = 128)
    seconds_to_wait = space_between_beats bpm
    beats.each do |beat|
      last_tick = Time.now
      speak_and_print beat.flatten, bpm
      wait_for_next_beat(seconds_to_wait, last_tick)
      next
    end
  end

  private

  def speak_and_print(noise, bpm = 128)
    puts noise
    say_noise noise, bpm
    clear_screen
  end

  def say_noise(noises, bpm)
    return if noises.is_a?(Array) && noises.length == 0
    noise = noises.is_a?(Array) ? noises.uniq.sort : noises
    `say -v Ellen -r #{bpm * 3.5} #{SOUNDS[noise]}`.class
  end
end
