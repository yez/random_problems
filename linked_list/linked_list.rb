class LinkedList
  attr_accessor :first

  def add_to_list(value)
    add_element(Node.new(value))
  end

  def to_s
    [].tap do |output|
      node = self.first
      while !node.nil?
        output << node.value
        node = node.next
      end
    end.join('->')
  end

  def reverse_recursive(current=self.first, last_node=nil)
    if current.nil?
      self.first = last_node
      return last_node
    end
    reverse_recursive(current.next, current).next = last_node
  end

  def reverse_iterative
    stack = []
    current = self.first

    while(!current.nil?) do
      stack.push(current)
      current = current.next
    end

    current = stack.pop
    self.first = current

    while(el = stack.pop) do
      current.next = el
      current = el
    end

    current.next = el
  end

  def reverse_iterative_in_place
    current = self.first
    node = nil
    while !current.nil?
      temp = current.next
      current.next = node
      node = current
      current = temp
    end
    self.first = node
  end

private

  def add_element(new_node, current=self.first)
    if current.nil?
      self.first = new_node
    elsif current.next.nil?
      current.next = new_node
    else
      add_element(new_node, current.next)
    end
  end

  class Node
    attr_accessor :next, :value, :id

    def initialize(value)
      self.value = value
    end
  end
end
