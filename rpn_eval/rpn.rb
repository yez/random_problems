require './expression_tree'
require './rpn_methods'

class RpnRunner
  include ::RpnMethods

  def initialize(args)
    @expression = args[0]
    @use_tree = args.include?('-t')
  end

  def run
    rpn(@expression, @use_tree)
  end
end

runner = RpnRunner.new(ARGV)
puts runner.run
