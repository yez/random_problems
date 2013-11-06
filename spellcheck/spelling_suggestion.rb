require './key_concern'
require './dictionary'

class SpellingSuggestion

  attr_reader :dictionary

  include KeyConcern

  def initialize(input_file=nil)
    build_dictionary(input_file)
  end

  def start_user_input
    @output_to_screen = true
    get_input
  end

  def suggest_spelling(word)
    only_letters = word.to_s.scan(/[A-Za-z]+/).join.to_s
    only_letters.downcase!
    lookup_word(only_letters.to_s)
  end

private

  def lookup_word(word)
    key = key_from_word(word)
    de_duped_key = de_duped_letters(word)
    matched_word = catch(:found) do
      unless @dictionary.find_by_key(key).nil?
        [
          :is_same_word?,
          :is_word_with_duplicates?,
        ].each do |method|
          unless @dictionary.find_by_de_duped_key(key, de_duped_key).nil?
            @dictionary.find_by_de_duped_key(key, de_duped_key).each do |possible_word|
              throw(:found, possible_word) if send(method, word, possible_word)
            end
          end

          @dictionary.find_by_key(key).each do |_,patterns|
            patterns.each do |possible_word|
              throw(:found, possible_word) if send(method, word, possible_word)
            end
          end
        end
        throw(:found, false)
      end
    end

    matched_word || no_result
  end

  def no_result
    "NO SUGGESTION"
  end

  def is_same_word?(input, dictionary_word)
    input == dictionary_word
  end

  def is_word_with_duplicates?(input, dictionary_word)
    new_input = de_duped_letters(input.gsub(/a|e|i|o|u/, ''))
    new_dictionary_word = de_duped_letters(dictionary_word.gsub(/a|e|i|o|u/, ''))

    new_input == new_dictionary_word
  end

  def build_dictionary(input_file)
    @dictionary = Dictionary.new(input_file)
  end
end
