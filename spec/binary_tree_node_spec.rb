RSpec.describe BinaryTreeNode do

  before(:example) do 
    @node1 = BinaryTreeNode.new(5)
  end

  describe "when initialized" do 
    it "should initialize with data" do 
      expect(@node1.data).to eq(5)
    end

    it "should have nil values for right and left" do
      expect(@node1.right).to eq(nil)
      expect(@node1.left).to eq(nil)
    end
  end

  describe "when insert is called" do 
    it "will insert a node" do 
      @node1.insert(2)
      expect(@node1.left.data).to eq(2)
    end

    it "will insert a node with less value to the left" do 
      @node1.insert(4)
      expect(@node1.left.data).to eq(4)
    end

    it "will insert a node with higher value to the right" do 
      @node1.insert(6)
      expect(@node1.right.data).to eq(6)
    end
  end
end