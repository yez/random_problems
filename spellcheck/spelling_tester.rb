require './key_concern'
require './dictionary'

class SpellingTester
  attr_accessor :dictionary, :test_words

  def initialize
    load_dictionary
    generate_test_words
    run_tests
  end

  def load_dictionary
    self.dictionary = Dictionary.new
  end

  def generate_test_words
    self.test_words = [].tap do |test_arr|
      100.times do
        word = random_word_from_dictionary
        mutated_word = mutate_word(word)
        test_arr << mutated_word
      end
    end
  end

  def run_tests
    suggestor = SpellingSuggestion.new
    test_words.each do |test_word|
      is_no_suggestion = (suggestor.suggest_spelling(test_word) == "NO SUGGESTION")
      failed << test_word if is_no_suggestion
    end

    if failed == []
      print "SUCCESS! No words were unable to be corrected"
    else
      puts "FAILURE! Failed words: #{failed}"
    end
  end

  def failed
    @failed ||= []
  end

  def mutate_word(word)
    case rand(0..4)
    when 0
      word.gsub(/i/,'e')
    when 1
      pivot = (word.length / 3)
      "#{word[0..pivot].upcase}#{word[pivot..(pivot*2)]}#{word[(pivot*2)..-1]}"
    when 2
      word.sub(/([bcdfghjklmn])/,'\\1\\1')
    when 3
      word.upcase
    else
      word.gsub(/e/, 'a')
    end
  end

  def random_word_from_dictionary
    @dictionary_length ||= (self.dictionary.to_hash.keys.length - 1)
    first_index = self.dictionary.to_hash.keys.sample
    second_index = self.dictionary.find_by_key(first_index).keys.sample
    self.dictionary.find_by_de_duped_key(first_index, second_index).first
  end
end
