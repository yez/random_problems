require './spiral'

describe Spiral do
  subject { described_class.new(height, width, starting_point)}
  let(:starting_point) { '0,0' }

  context '4x4 matrix' do
    let(:height) { 4 }
    let(:width)  { 4 }

    it { expect(subject.path).to eq '1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10' }
    it { expect(subject.path.split(',').uniq.length).to eq height * width }
  end

  context '4x6 matrix' do
    let(:height) { 4 }
    let(:width)  { 6 }

    it { expect(subject.path).to eq '1,2,3,4,5,6,12,18,24,23,22,21,20,19,13,7,8,9,10,11,17,16,15,14' }
    it { expect(subject.path.split(',').uniq.length).to eq height * width }
  end

  context '8x3 matrix' do
    let(:height) { 8 }
    let(:width)  { 3 }

    it { expect(subject.path).to eq '1,2,3,6,9,12,15,18,21,24,23,22,19,16,13,10,7,4,5,8,11,14,17,20' }
    it { expect(subject.path.split(',').uniq.length).to eq height * width }
  end

  context '7x4 matrix' do
    let(:height) { 7 }
    let(:width)  { 4 }

    it { expect(subject.path).to eq '1,2,3,4,8,12,16,20,24,28,27,26,25,21,17,13,9,5,6,7,11,15,19,23,22,18,14,10' }
    it { expect(subject.path.split(',').uniq.length).to eq height * width }
  end
end
