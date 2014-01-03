require './lib/node_inserter'

describe NodeInserter do
  context 'when tree is empty' do
    before { @tree = TreeNode.new }
    describe 'inserted node' do
      before do
        @node = TreeNode.new 6
        NodeInserter.insert(@tree, @node)
      end
      it 'becomes the root' do
        expect(@tree.value).to eq @node.value
      end
    end
  end

  context 'when tree has 1 node' do
    before do
      @tree = TreeNode.new 10
    end

    describe 'a small node' do
      before do 
        @node = TreeNode.new 5
        NodeInserter.insert @tree, @node
      end

      it 'is added to the left of the tree' do
        expect(@tree.left).to eq @node
      end
    end

    describe 'a large node' do
      before do 
        @node = TreeNode.new 20
        NodeInserter.insert @tree, @node
      end

      it 'is added to the right of the tree' do
        expect(@tree.right).to eq @node
      end
    end
  end

  context 'when tree has many nodes' do
    before do
      @tree = TreeNode.new 10
      @left = TreeNode.new 5
      @right = TreeNode.new 15

      @tree.set_left @left
      @tree.set_right @right
    end

    describe 'a small node' do
      before do 
        @node = TreeNode.new 1
        NodeInserter.insert @tree, @node
      end

      it 'is added to the left of the tree' do
        expect(@left.left).to eq @node
      end
    end

    describe 'a large node' do
      before do 
        @node = TreeNode.new 20
        NodeInserter.insert @tree, @node
      end

      it 'is added to the right of the tree' do
        expect(@right.right).to eq @node
      end
    end
  end
end