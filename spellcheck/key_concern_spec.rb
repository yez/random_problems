require './key_concern'

class TestClass
  include KeyConcern
end


describe KeyConcern do
  let(:test_class) { TestClass.new }

  describe '#de_duped_letters' do
    context 'given a string with adjacent duplicates' do
      it 'removes adjacent duplicates' do
        expect(test_class.de_duped_letters('aabbcc')).to eq 'abc'
      end
    end

    context 'given a string with no adjacent duplicates' do
      it 'returns the input string' do
        expect(test_class.de_duped_letters('abc')).to eq 'abc'
      end
    end
    context 'given an empty string' do
      it 'returns an empty string' do
        expect(test_class.de_duped_letters('')).to eq ''
      end
    end
    context 'given a value other than a string' do
      it 'returns an empty string' do
        expect(test_class.de_duped_letters(123)).to eq ''
        expect(test_class.de_duped_letters(nil)).to eq ''
        expect(test_class.de_duped_letters({})).to  eq  ''
      end
    end
  end

  describe '#key_from_word' do
    context 'given a word with vowels' do
      it 'returns the word with vowels replaced with # marks' do
        expect(test_class.key_from_word('dog')).to eq 'd#g'
      end

      context 'when the word has repeating vowels' do
        it 'minifies the # marks so one # represents one or more vowels' do
          expect(test_class.key_from_word('good')).to eq 'g#d'
        end
      end
    end

    context 'given a word with no vowels' do
      it 'returns the original word' do
        expect(test_class.key_from_word('bcd')).to eq 'bcd'
      end
    end
    context 'given an input that is not a string' do
      it 'returns and empty string' do
        expect(test_class.key_from_word(123)).to eq ''
        expect(test_class.key_from_word(nil)).to eq ''
        expect(test_class.key_from_word([])).to  eq ''
      end
    end
  end

  describe '#first_char_of_word_as_symbol' do
    context 'given a string with length > 0 ' do
      it 'returns the first value as a symbol' do
        expect(test_class.first_char_of_word_as_symbol('dog')).to eq :d
      end
    end
    context 'given an empty string' do
      it 'returns nil' do
        expect(test_class.first_char_of_word_as_symbol(nil)).to eq nil
      end
    end
    context 'given an input that is not a string' do
      it 'returns nil' do
        expect(test_class.first_char_of_word_as_symbol(123)).to        eq nil
        expect(test_class.first_char_of_word_as_symbol({})).to         eq nil
        expect(test_class.first_char_of_word_as_symbol(Object.new)).to eq nil
      end
    end
  end
end
