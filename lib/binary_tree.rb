class BinaryTree
  attr_reader :head

  def initialize(head = nil)
    @head = head
  end

  def push(value)
    @head = BinaryTreeNode.new(value) if @head.nil?
    @head.insert(value)
  end

  def traverse(node = @head, &block)
    return nil if node.nil?
    traverse(node.left, &block) if node.left
    yield node
    traverse(node.right, &block) if node.right
  end

  def pre_traverse(node = @head, &block)
    return nil if node.nil?
    yield node
    traverse(node.left, &block) if node.left
    traverse(node.right, &block) if node.right    
  end

  def post_traverse(node = @head, &block)
    return nil if node.nil?
    traverse(node.left, &block) if node.left
    traverse(node.right, &block) if node.right   
    yield node
  end

  def depth_first_search(node = @head, term)
    return nil if node.nil?
    if term < node.data
      depth_first_search(node.left, term)
    elsif term > node.data
      depth_first_search(node.right, term)
    else
      return node
    end
  end

  def breadth_first_search(node = @head, term)
    queue = [] 
    queue.push(node)

    until(queue.empty?)
      current = queue.shift
      return current if current.data == term
      queue.push(current.left) if current.left
      queue.push(current.right) if current.right
    end

    return nil
  end   

  def length
    count = 0
    traverse{count += 1}
    return count
  end

  def sum
    total = 0
    traverse {|node| total += node.data}
    return total
  end

  def left_length
    count = 0
    node = @head
    until node.left.nil?
      count += 1 if !node.left.data.nil?
      count += 1 if !node.right.data.nil?
      node = node.left
    end
    return count
  end

  def right_length
    count = 0
    node = @head
    until node.right.nil?
      count += 1 if !node.left.data.nil?
      count += 1 if !node.right.data.nil?
      node = node.right
    end
    return count
  end   
 
 
end