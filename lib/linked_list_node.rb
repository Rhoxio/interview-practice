# This node needs to have an @data attribute and a @pointer
# 

class LinkedListNode
  attr_accessor :value, :pointer
  def initialize(value, pointer = nil)
    # Value can be potentially anything.
    @value = value
    @pointer = pointer
  end

  def end?
    !@pointer
  end

end