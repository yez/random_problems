require './expression_tree'
require './rpn_methods'

describe RpnMethods do
  subject do
    class Example
      include RpnMethods
    end.new
  end

  describe '#rpn' do
    context 'with a valid input' do
      it { expect(subject.rpn('1 2 +')).to eq 3 }
      it { expect(subject.rpn('4 2 /')).to eq 2 }
      it { expect(subject.rpn('2 3 4 + *')).to eq 14 }
      it { expect(subject.rpn('3 4 + 5 6 + *')).to eq 77 }
      it { expect(subject.rpn('13 4 -')).to eq 9 }
      it { expect(subject.rpn('1 2 3 4 + + +')).to eq 10 }
    end

    context 'with invalid input' do
      it { expect(subject.rpn('1 +')).to eq "not enough arguments" }
      it { expect(subject.rpn('a b +')).to eq "invalid number" }
    end
  end

  context 'using a tree' do
    describe '#rpn_expression_tree' do
      context 'with a valid input' do
        it { expect(subject.rpn('1 2 +', tree=true)).to eq 3 }
        it { expect(subject.rpn('4 2 /', tree=true)).to eq 2 }
        it { expect(subject.rpn('2 3 4 + *', tree=true)).to eq 14 }
        it { expect(subject.rpn('3 4 + 5 6 + *', tree=true)).to eq 77 }
        it { expect(subject.rpn('13 4 -', tree=true)).to eq 9 }
        it { expect(subject.rpn('1 2 3 4 + + +', tree=true)).to eq 10 }
      end

      context 'with invalid input' do
        it { expect(subject.rpn('1 +', tree=true)).to eq "not enough arguments" }
        it { expect(subject.rpn('a b +', tree=true)).to eq "invalid number" }
      end
    end
  end
end
