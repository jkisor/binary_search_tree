require './lib/tree_node'
require './lib/node_remover'
require './lib/node_finder'

class BinarySearchTree

  def initialize
    @root = TreeNode.new
  end

  def insert value
    node = TreeNode.new(value)
    inserter = NodeInserter.insert(@root, node)
  end

  def insert_many array
    array.each { |i| insert(i)}
  end

  def delete value
    node = NodeFinder.find(@root, value)
    NodeRemover.remove(node)
  end

  #for easier integration testing
  def to_a #preorder
    @root.to_a
  end
end
