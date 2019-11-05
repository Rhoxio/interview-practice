# This uses LinkedListNode

class CustomQueue
  attr_reader :head, :tail

  def initialize(head = nil)
    @head = head
    @tail = nil
  end

  def empty?
    !@head
  end

  def enqueue(value)
    new_node = LinkedListNode.new(value)
    if @head.nil?
      @head = new_node
    elsif @tail.nil?
      @tail = new_node
      @head.pointer = @tail
    else 
      new_tail = new_node
      @tail.pointer = new_tail
      @tail = new_tail
    end
    return new_node.value
  end

  def dequeue
    old_head = @head
    @head = @head.pointer
    return old_head.value
  end

  def reverse
    stack = Stack.new
    
    until empty?
      stack.push(dequeue)
    end

    until stack.empty?
      enqueue(stack.pop)
    end
    return self
  end
 
end