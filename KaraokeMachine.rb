class KaraokeMachine
  KEYS = %w(C C# D D# E F F# G G# A A# B)

  def initialize(melody)
    @melody = melody
  end

  def transpose(amount)
    @melody.scan(/[A-G|\s]#?/).map{|key| change_key(key, amount) }.join
  end

  private

  def change_key(key, updown)
    return key if key =~ /\s|\|/

    idx = KEYS.index(key)
    changed_idx = (idx + updown) % KEYS.length

    KEYS[changed_idx]
  end
end

