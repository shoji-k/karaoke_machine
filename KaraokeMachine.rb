class KaraokeMachine
  def initialize(melody)
    @melody = melody
    @keys = ['C','C#','D','D#','E','F','F#','G','G#','A','A#','B']
  end
  def transpose(amount)
    @melody.scan(/[A-G|\s]#?/).map {|key|
      change_key(key, amount)
    }.join
  end

  private
  def change_key(key, updown)

    # return not key
    return key if key =~ / |\|/

    # get index by key
    idx = @keys.index(key)

    # change key
    changed_idx = (idx + updown) % @keys.length

    @keys[changed_idx]
  end

end

