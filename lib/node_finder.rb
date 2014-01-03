class NodeFinder
  def self.find(where, what)
    current = where
    while !current.nil?
      if current.value == what
        return current
      elsif what < current.value
        current = current.left
      else
        current = current.right
      end
    end 
  end

  def self.find_min start
    current = start
    while !current.left.nil?
      current = current.left
    end
    current
  end

  def self.find_max start
    current = start
    while !current.right.nil?
      current = current.right
    end
    current
  end
end