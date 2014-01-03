require './lib/node_remover'
describe NodeRemover do
  describe 'given a target node' do
    before { @node = TreeNode.new }
    describe 'thats a left child' do
      before do
        @parent = TreeNode.new
        @parent.set_left @node
      end
      describe 'that has no children' do
        its 'parents left is nil' do
          NodeRemover.remove(@node)
          expect(@parent.left).to eq nil
        end
      end

      describe 'that has only left child' do
        before do
          @left_child = TreeNode.new
          @node.set_left @left_child
        end

        its 'parents left is the child' do
          NodeRemover.remove(@node)
          expect(@parent.left).to eq @left_child
        end
      end

      describe 'that has only right child' do
        before do
          @right_child = TreeNode.new
          @node.set_right @right_child
        end

        its 'parents left is the child' do
          NodeRemover.remove(@node)
          expect(@parent.left).to eq @right_child
        end
      end

      describe 'that has both children' do
        before do
          @left_child = TreeNode.new
          @right_child = TreeNode.new
          @right_child_left = TreeNode.new 1

          @node.set_left(@left_child)
          @node.set_right(@right_child)
          @right_child.set_left(@right_child_left)
        end
        it 'parents left value is now targets right child left leaf value' do
          NodeRemover.remove(@node)
          expect(@parent.left.value).to eq @right_child_left.value
        end
      end
    end
    
    describe 'thats a right child' do
      before do
        @parent = TreeNode.new
        @parent.set_right @node
      end
      describe 'that has no children' do
        its 'parents right is nil' do
          NodeRemover.remove(@node)
          expect(@parent.right).to eq nil
        end
      end

      describe 'that has only left child' do
        before do
          @left_child = TreeNode.new
          @node.set_left @left_child
        end

        its 'parents right is the child' do
          NodeRemover.remove(@node)
          expect(@parent.right).to eq @left_child
        end
      end

      describe 'that has only right child' do
        before do
          @right_child = TreeNode.new
          @node.set_right @right_child
        end

        its 'parents right is the child' do
          NodeRemover.remove(@node)
          expect(@parent.right).to eq @right_child
        end
      end

      describe 'that has both children' do
        before do
          @left_child = TreeNode.new
          @right_child = TreeNode.new
          @right_child_left = TreeNode.new 1

          @node.set_left(@left_child)
          @node.set_right(@right_child)
          @right_child.set_left(@right_child_left)
        end
        it 'parents right value is now targets right child left leaf value' do
          NodeRemover.remove(@node)
          expect(@parent.right.value).to eq @right_child_left.value
        end
      end
    end
  end
end