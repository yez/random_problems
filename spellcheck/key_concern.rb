module KeyConcern
  def de_duped_letters(word)
    new_string = ""
    if word.is_a? String
      word.chars.each do |char|
        new_string << char unless new_string[-1] == char
      end
    end
    new_string
  end

  def key_from_word(word)
    key = ""
    if word.is_a? String
      subbed_word = word.gsub(/[a|e|i|o|u]+/, '#')
      subbed_word.chars.each do |char|
        key << char unless key[-1] == char
      end
    end
    key
  end

  def first_char_of_word_as_symbol(word)
    word[0].to_sym if word.is_a?(String) && word.length > 0
  end
end
