class Stack
  attr_reader :head

  def initialize(head = nil)
    raise ArgumentError, "Please provide a LinkedListNode class as an argument" if head.class != LinkedListNode && !head.nil?
    @head = head
  end

  def any?
    !!@head
  end

  def empty?
    !@head
  end

  def push(value)
    node = any? ? @head : nil
    @head = LinkedListNode.new(value, node)
  end

  def pop
    return nil if !any?
    old_head = @head
    @head = @head.pointer
    return old_head.value
  end

  def find(value)
    current_node = @head
    until current_node.end?
      return current_node if current_node.value == value
      current_node = current_node.pointer
    end
    return current_node if current_node.value == value
    return false
  end

  def reverse
    new_stack = Stack.new
    until empty?
      new_stack.push(pop)
    end
    return new_stack
  end

  def reverse!
    current_node = @head
    previous_node = nil
    next_node = nil 

    until current_node.end?
      next_node = current_node.pointer
      current_node.pointer = previous_node

      previous_node = current_node
      current_node = next_node
    end

    next_node = current_node.pointer
    current_node.pointer = previous_node

    @head = current_node
  end

  def to_a
    array = []
    current_node = @head
    until current_node.end?
      array << current_node.value
      current_node = current_node.pointer
    end
    array << current_node.value
    return array
  end


end