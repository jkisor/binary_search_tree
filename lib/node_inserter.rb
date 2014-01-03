class NodeInserter
  def self.insert start, node
    if start.value.nil?
      start.value = node.value 
      return
    end

    if(node.value <= start.value)
      insert_left(start, node)
    else
      insert_right(start, node)
    end
  end
  
  private

  def self.insert_left start, node
    if(start.left.nil?)
      start.set_left(node)
    else
      insert(start.left, node)
    end
  end

  def self.insert_right start, node
    if(start.right.nil?)
      start.set_right(node)
    else
      insert(start.right, node)
    end
  end
end