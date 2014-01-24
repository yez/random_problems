module RpnMethods
  def rpn_tree(input)
    tree = ExpressionTree.new(input)
    tree.evaluate_rpn
  end

  def rpn_stack(input)
    [].tap do |stack|
      input.each do |c|
        if !is_operator?(c)
          stack.push(to_i(c))
        else
          second_argument  = stack.pop
          if stack.empty?
            stack.push(second_argument)
          else
            stack.push(stack.pop.send(c, second_argument))
          end
        end
      end
    end.first
  end

  def rpn(input, tree=false)
    begin
      input_array = input.split(' ')
      raise "not enough arguments" and return unless input_array.length % 2 != 0
      if tree
        rpn_tree(input_array)
      else
        rpn_stack(input_array)
      end
    rescue StandardError => e
      e.to_s
    end
  end

  def to_i(string)
    if is_operator?(string)
      string
    elsif !string.nil?
      num = 0
      length = string.length - 1
      string.chars.each_with_index do |c, i|
        num += string_to_digit(c) * (10 ** (length - i))
      end
      num
    end
  end

  def string_to_digit(string)
    num = string.ord - offest
    unless num <= 9
      raise "invalid number"
    end
    num
  end

  def is_operator?(char)
    %w(+ - / *).include? char
  end

  def offest
    "0".ord
  end
end
