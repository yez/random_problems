require './array_sort'

describe ArraySort do
  subject { described_class.new(array_1, array_2) }
  context 'given 2 sorted arrays' do
    context 'given: [1,2,3,5,9,10] and [1,12,14,20]' do
      let(:array_1) { [1,2,3,5,9,10] }
      let(:array_2) { [1,12,14,20] }

      it { expect(subject.combine).to eq [1,1,2,3,5,9,10,12,14,20] }
    end

    context 'given: [1,2,3,5,9,10] and [3,3,5,12,14,20]' do
      let(:array_1) { [1,2,3,5,9,10] }
      let(:array_2) { [3,3,5,12,14,20] }

      it { expect(subject.combine).to eq [1,2,3,3,3,5,5,9,10,12,14,20] }
    end

    context 'given: [1,2,3,4] and [1,2,3,4]' do
      let(:array_1) { [1,2,3,4] }
      let(:array_2) { [1,2,3,4] }

      it { expect(subject.combine).to eq [1,1,2,2,3,3,4,4] }
    end

    context 'given: [] and [1,2,3,4]' do
      let(:array_1) { [] }
      let(:array_2) { [1,2,3,4] }

      it { expect(subject.combine).to eq [1,2,3,4] }
    end

    context 'given: [1,2,3,4] and []' do
      let(:array_1) { [1,2,3,4] }
      let(:array_2) { [] }

      it { expect(subject.combine).to eq [1,2,3,4] }
    end
  end
end
