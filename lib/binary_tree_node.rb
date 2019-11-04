class BinaryTreeNode
  attr_accessor :data, :right, :left

  def initialize(data)
    @data = data
    @right = nil
    @left = nil
  end

  def insert(value)
    # Recursively traversing until nil, then slots to left or right based on 
    # previous node's data.
    if value <= @data
      @left.nil? ? @left = BinaryTreeNode.new(value) : @left.insert(value)
    elsif value > @data
      @right.nil? ? @right = BinaryTreeNode.new(value) : @right.insert(value)
    end
  end

end