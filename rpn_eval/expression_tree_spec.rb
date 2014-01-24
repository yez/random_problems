require './expression_tree'

describe ExpressionTree do
  context 'given an input' do
    let(:tree) { ExpressionTree.new( %w(2 3 4 + *) ) }

    it 'builds and prints a tree' do
      expect(tree.root.value).to eq             "*"
      expect(tree.root.left.value).to eq        "2"
      expect(tree.root.right.value).to eq       "+"
      expect(tree.root.right.left.value).to eq  "3"
      expect(tree.root.right.right.value).to eq "4"
    end

    context 'summing the tree' do
      it 'does the operations in the proper order' do
        expect(tree.evaluate_rpn). to eq 14
        tree = ExpressionTree.new( %w(1 2 +) )
        expect(tree.evaluate_rpn).to eq 3
        tree = ExpressionTree.new( %w(4 2 /) )
        expect(tree.evaluate_rpn).to eq 2
        tree = ExpressionTree.new( %w(2 3 4 + *) )
        expect(tree.evaluate_rpn).to eq 14
        tree = ExpressionTree.new( %w(3 4 + 5 6 + *) )
        expect(tree.evaluate_rpn).to eq 77
        tree = ExpressionTree.new( %w(13 4 -) )
        expect(tree.evaluate_rpn).to eq 9
        tree = ExpressionTree.new( %w(1 2 3 4 + + +) )
        expect(tree.evaluate_rpn).to eq 10
      end
    end

    context 'pathing the tree' do
      context 'in-order pathing' do
        it { expect(tree.in_order).to eq '2*3+4' }
      end

      context 'pre-order pathing' do
        it { expect(tree.pre_order).to eq '*2+34' }
      end

      context 'post-order pathing' do
        it { expect(tree.post_order).to eq '234+*' }
      end
    end
  end
end
