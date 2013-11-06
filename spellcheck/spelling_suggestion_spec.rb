require './spelling_suggestion'

describe SpellingSuggestion do
  let(:spelling_suggestion) { SpellingSuggestion.new }
  let(:words)               { %w(o on one two three four five six seven eight nine ten) }
  before do
    Dictionary.any_instance.stub(:read_lines) { words }
  end

  context 'given a list of simple words' do
    let(:expected_dictionary) do
      {
        '#'     => { "o"     =>  ['o'] },
        '#n'    => { "on"    =>  ['on'] },
        '#n#'   => { "one"   =>  ['one'] },
        'tw#'   => { "two"   =>  ['two'] },
        'thr#'  => { "thre"  =>  ['three'] },
        't#n'   => { "ten"   =>  ['ten'] },
        'f#r'   => { "four"  =>  ['four'] },
        'f#v#'  => { "five"  =>  ['five'] },
        's#x'   => { "six"   =>  ['six'] },
        's#v#n' => { "seven" =>  ['seven'] },
        '#ght' =>  { "eight" =>  ['eight'] },
        'n#n#' =>  { "nine" =>   ['nine'] },
      }
    end

    it 'makes a hash to lookup words with' do
      expect(spelling_suggestion.send(:dictionary).to_hash).to eq expected_dictionary
    end

    describe '#suggest_spelling' do
      context 'when we have an input that can be corrected' do
        context 'input with duplicated letters' do
          it 'corrects the input' do
            expect(spelling_suggestion.suggest_spelling('onnnne')).to eq 'one'
          end
        end

        context 'input with wrong vowels' do
          it 'corrects the input' do
            expect(spelling_suggestion.suggest_spelling('sevan')).to eq 'seven'
          end
        end

        context 'input with upper and lower case letters' do
          it 'corrects the input' do
            expect(spelling_suggestion.suggest_spelling('THrEe')).to eq 'three'
          end
        end

        context 'when partial words exist in the dictionary' do
          it 'corrects to the full word' do
            expect(spelling_suggestion.suggest_spelling('oOonnnE')).to eq 'one'
          end
        end

        context 'mixture of different errors' do
          it 'corrects the input' do
            expect(spelling_suggestion.suggest_spelling('NonnE')).to eq 'nine'
          end
          context 'with really weird input' do
            it 'corrects the input' do
              expect(spelling_suggestion.suggest_spelling('EaaAghhHHht')).to eq 'eight'
            end

            it 'handles mixed input' do
              expect(spelling_suggestion.suggest_spelling('on11ne')).to eq 'one'
            end
          end
        end
      end

      context 'when we have an input that can not be corrected' do
        it 'returns "NO SUGGESTION"' do
          expect(spelling_suggestion.suggest_spelling('BANANANANANN')).to eq 'NO SUGGESTION'
        end

        it 'does not break on non strings' do
          expect{ spelling_suggestion.suggest_spelling(123) }.to_not raise_error
          expect{ spelling_suggestion.suggest_spelling(nil) }.to_not raise_error
          expect{ spelling_suggestion.suggest_spelling([]) }.to_not  raise_error
          expect{ spelling_suggestion.suggest_spelling({}) }.to_not  raise_error
          expect{ spelling_suggestion.suggest_spelling("\n\n\n\n\n") }.to_not  raise_error
        end
      end
    end
  end

  context 'given a list of more unique words' do
    let(:words) { %w(slap sleep sheep pale people papule persons persona conspiracy) }

    it 'corrects the input appropriately' do
      expect(spelling_suggestion.suggest_spelling('peepple')).to eq 'people'
      expect(spelling_suggestion.suggest_spelling('sheeeeep')).to eq 'sheep'
      expect(spelling_suggestion.suggest_spelling('sleeeeep')).to eq 'sleep'
      expect(spelling_suggestion.suggest_spelling('sheeeeepple')).to eq 'NO SUGGESTION'
      expect(spelling_suggestion.suggest_spelling('CUNsperrICY')).to eq 'conspiracy'
    end
  end
end
