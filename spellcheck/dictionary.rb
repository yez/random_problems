class Dictionary

  include KeyConcern

  attr_accessor :input_file

  INPUT_FILE = '/usr/share/dict/words'

  def initialize(file_name=nil)
    self.input_file = file_name.nil? ? INPUT_FILE : file_name
    fill_dictionary
    sort_dictionary
  end

  def dictionary
    @dictionary ||= {}
  end

  def find_by_key(key)
    dictionary[key]
  end

  def find_by_de_duped_key(key, dedupe_key)
    key_result = find_by_key(key)
    unless key_result.nil?
      key_result[dedupe_key]
    end
  end

  def to_hash
    dictionary
  end

private

  def fill_dictionary
    read_lines.each do |word|
      key = key_from_word(word)
      dedupe_key = de_duped_letters(word)
      dictionary[key] ||= {}
      dictionary[key][dedupe_key] ||= []
      dictionary[key][dedupe_key] << word
    end
  end

  def sort_dictionary
    dictionary.each do |_,second_hashes|
      second_hashes.each do |_, word_arr|
        word_arr.sort!
      end
    end
  end

  def dictionary
    @dictionary ||={}
  end

  def read_lines
    Enumerator.new do |enum|
      File.open(input_file, 'r').each_line do |line|
        enum << line.strip.downcase
      end
    end
  end
end
