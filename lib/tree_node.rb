class TreeNode
  attr_accessor :value, :left, :right, :parent
  def initialize value=nil
    @value = value
  end

  def set_left child
    @left = child
    child.parent = self
  end

  def set_right child 
    @right = child
    child.parent = self
  end

  def children
    array = []
    array << @left unless @left.nil?
    array << @right unless @right.nil?
    array
  end

  #for easier integration testing
  def to_a #preorder
    return [] if @value.nil?
    
    array = []
    array << @value 
    array << @left.to_a
    array << @right.to_a

    array
  end
end