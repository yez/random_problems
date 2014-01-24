require './rpn_methods'

class ExpressionTree
  include ::RpnMethods

  attr_accessor :root

  def initialize(array)
    array.reverse.each do |val|
      add_to_tree(Node.new(val))
    end
  end

  def add_to_tree(node, root=self.root)
    if root.nil?
      self.root = node
    elsif root.right.nil?
      root.right = node
    elsif is_operator?(root.right.value)
      if add_to_tree(node, root.right)
        return true
      else
        if root.left.nil?
          root.left = node
        elsif is_operator?(root.left.value)
          add_to_tree(node, root.left)
        end
      end
    elsif root.left.nil?
      root.left = node
    else
      return false
    end
  end

  def evaluate_rpn(node=self.root, sum=0)
    return to_i(node.value) if node.right.nil? && node.left.nil?
    evaluate_rpn(node.left).send(node.value, evaluate_rpn(node.right))
  end

  def in_order(node=self.root, path="")
    in_order(node.left, path) if !node.left.nil?
    path << node.value
    in_order(node.right, path) if !node.right.nil?
    path
  end

  def pre_order(node=self.root, path="")
    path << node.value
    pre_order(node.left, path) if !node.left.nil?
    pre_order(node.right, path) if !node.right.nil?
    path
  end

  def post_order(node=self.root, path="")
    post_order(node.left, path) if !node.left.nil?
    post_order(node.right, path) if !node.right.nil?
    path << node.value
  end

  class Node
    attr_accessor :left, :right, :value
    def initialize(value)
      self.value = value
    end
  end
end
