class KaraokeMachine
  def initialize(melody)
    @melody = melody
    @keys = ['C','C#','D','D#','E','F','F#','G','G#','A','A#','B']
  end
  def transpose(amount)
    @melody.scan(/[A-G|\s]#?/).map {|key|
      keychanger(key, amount)
    }.join
  end

  private
  def keychanger(key, updown)

    # return not key
    return key if key == "|"
    return key if key == " "

    # get index by key
    idx = -1
    @keys.each_with_index do |doremi,i|
      if doremi == key
        idx = i
        break
      end
    end

    # change key
    idx += updown
    idx = idx % @keys.length

    return @keys[idx]
  end

end

