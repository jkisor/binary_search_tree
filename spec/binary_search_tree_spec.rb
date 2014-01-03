require './lib/binary_search_tree'

describe BinarySearchTree do
  let(:tree) { BinarySearchTree.new }

  context 'when empty' do
    its 'has no elements' do
      expect(tree.to_a).to eq []
    end
  end

  describe 'insertion' do
    before { tree.insert_many [15,9,20,8,22,13] }
    it 'has the elements' do
      expect(tree.to_a).to eq [15, [9, [8, [], []], [13, [], []]], [20, [], [22, [], []]]]
    end
  end

  describe 'deleting' do
    describe 'a left child' do
      describe 'that has no children' do
        before { tree.insert_many [3,4,2] }
        it 'no longer in the tree' do
          tree.delete 2
          expect(tree.to_a).to eq [3, [], [4, [], []]]
        end
      end

      describe 'that has only left child' do
        before { tree.insert_many [3,4,2,1] }
        it 'no longer in the tree' do
          tree.delete 2
          expect(tree.to_a).to eq [3, [1,[],[]], [4,[],[]]]
        end
      end

      describe 'that has only right child' do
        before { tree.insert_many [5,3,7,4]}
        it 'no longer in the tree' do
          tree.delete 3
          expect(tree.to_a).to eq [5, [4,[],[]], [7,[],[]]]
        end
      end

    end

    describe 'a right child' do
      describe 'that has no children' do
        before do 
          tree.insert_many [3,4,2]
          tree.delete 4
        end

        it 'no longer in the tree' do
          expect(tree.to_a).to eq [3, [2, [], []], []]
        end
      end

      describe 'that has only left child' do
        before { tree.insert_many [20,15,30,25] }
        it 'no longer in the tree' do
          tree.delete 30
          expect(tree.to_a).to eq [20, [15,[],[]], [25,[],[]]]
        end
      end

      describe 'that has only right child' do
        before { tree.insert_many [20,15,30,50] }
        it 'no longer in the tree' do
          tree.delete 30
          expect(tree.to_a).to eq [20, [15,[],[]], [50,[],[]]]
        end
      end
    end

    #prob same for right child case
    describe 'node with 2 children' do
      before { tree.insert_many [5,3,7,4] }
      it 'no longer in the tree' do
        tree.delete 5
        expect(tree.to_a).to eq [7, [3,[],[4, [],[]]], []]
      end
    end
  end
end