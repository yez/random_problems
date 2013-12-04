require './fizz_buzz'

describe FizzBuzz do

  context 'given the number 50' do
    let(:numbers) do
      [
        1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz',
        11, 'fizz', 13, 14, 'fizzbuzz', 16, 17, 'fizz', 19, 'buzz',
        'fizz', 22, 23, 'fizz', 'buzz', 26, 'fizz', 28, 29, 'fizzbuzz',
        31, 32, 'fizz', 34, 'buzz', 'fizz', 37, 38, 'fizz', 'buzz',
        41, 'fizz', 43, 44, 'fizzbuzz', 46, 47, 'fizz', 49, 'buzz'
      ]
    end
    context 'recursively' do
      it 'fizz buzzes' do
        expect(subject.recursive_fizz_buzz(50)).to eq numbers.join(',')
      end
    end

    context 'iteratively' do
      it 'fizz buzzes' do
        expect(subject.iterative_fizz_buzz(50)).to eq numbers.join(',')
      end
    end
  end
end
