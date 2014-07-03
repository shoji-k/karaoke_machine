class KaraokeMachine
  def initialize(melody)
    @melody = melody
    @keys = ['C','C#','D','D#','E','F','F#','G','G#','A','A#','B']
  end
  def transpose(amount)

    return @melody if @melody == ""
    return @melody if amount == 0

    result = []
    @melody.scan(/[A-G|\s]#?/).each do |key|
      result << keychanger(key, amount)
    end

    return result.join("")

  end

  private
  def keychanger(key, updown)

    # return not key
    return key if key == "|"
    return key if key == " "

    # skip
    return key if updown == 0

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

