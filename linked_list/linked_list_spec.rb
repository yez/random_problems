require './linked_list'

describe LinkedList do

  let(:list) do
    list = LinkedList.new
    %w(1 2 3 4 5).each do |el|
      list.add_to_list(el)
    end
    list
  end

  context 'given a list of elements' do
    it 'creates a linked list' do
      expect(list.to_s).to eq '1->2->3->4->5'
    end

    context 'reversing the list' do
      context 'recursively' do
        it 'correctly reverses the list\'s elements' do
          list.reverse_recursive
          expect(list.to_s).to eq '5->4->3->2->1'
        end
      end
      context 'iteratively' do
        it 'correctly reverses the list\'s elements' do
          list.reverse_iterative
          expect(list.to_s).to eq '5->4->3->2->1'
        end

        context 'in place' do
          it 'correctly reverses the list\'s elements' do
            list.reverse_iterative_in_place
            expect(list.to_s).to eq '5->4->3->2->1'
          end
        end
      end
    end
  end
end
