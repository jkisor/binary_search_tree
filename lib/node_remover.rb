require './lib/node_finder'
class NodeRemover
  def self.remove(node)
    children = node.children
    if (children.count == 2)
      successor = NodeFinder.find_min(node.right) # or find_max(node.left)
      node.value = successor.value
      remove successor
    elsif(children.count == 1)
      replace(node, children[0])
    else # no children
      replace(node, nil)
    end

    node.parent = nil  
  end

  private 
    def self.replace dest, source
      if dest.parent.left == dest
        dest.parent.left = source
      elsif dest.parent.right == dest
        dest.parent.right = source
      end 

      source.parent = dest.parent unless source.nil?
    end
end