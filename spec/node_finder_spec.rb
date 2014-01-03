require './lib/node_finder'

describe NodeFinder do
  before do
    @root = TreeNode.new 6
    @left = TreeNode.new 4
    @right = TreeNode.new 8

    @root.set_left @left
    @root.set_right @right
  end

  it 'finds a left node' do
    found = NodeFinder.find(@root, @left.value)
    expect(found).to eq @left
  end

  it 'finds a right node' do
    found = NodeFinder.find(@root, @right.value)
    expect(found).to eq @right
  end

  it 'finds a root' do
    found = NodeFinder.find(@root, @root.value)
    expect(found).to eq @root
  end
  it 'finds the min node of a tree' do
    expect(NodeFinder.find_min(@root)).to eq @left
  end

  it 'finds the max node of a tree' do
    expect(NodeFinder.find_max(@root)).to eq @right
  end
end