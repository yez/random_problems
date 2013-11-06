#! /usr/bin/ruby
require './spelling_suggestion'
require './spelling_tester'

args             = ARGV.reject { |arg| %w(-t -d).include? arg }
local_dictionary = args.first
run_tests        = ARGV.include?('-t')

def interactive_mode(local_dictionary)
  begin
    spelling_suggestion = SpellingSuggestion.new(local_dictionary)
    print "> "

    while(input = gets.chomp) do
      if input == 'exit'
        break
      end
      puts spelling_suggestion.suggest_spelling(input)
      print "> "
    end
  rescue Errno::ENOENT
    puts "Dictionary Not Found"
  end
end

def test_mode
  SpellingTester.new
end

if run_tests
  test_mode
else
  interactive_mode(local_dictionary)
end
