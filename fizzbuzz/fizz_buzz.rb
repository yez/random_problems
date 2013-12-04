class FizzBuzz
  def recursive_fizz_buzz(num, output=[])
    return output.unshift(num).join(',') if num <= 1
    output.unshift begin
      if num % 15 == 0
        "fizzbuzz"
      elsif num % 5 == 0
        "buzz"
      elsif num % 3 == 0
        "fizz"
      else
        num
      end
    end
    recursive_fizz_buzz(num-1, output)
  end

  def iterative_fizz_buzz(num)
    [].tap do |words|
      1.upto(num) do |i|
        word = ''
        word << 'fizz' if i % 3  == 0
        word << 'buzz' if i % 5  == 0
        word =  i if word.empty?
        words << word
      end
    end.join(',')
  end
end
