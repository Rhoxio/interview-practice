RSpec.describe BinaryTree do

  before(:example) do 
    @node = BinaryTreeNode.new(5)
    @tree = BinaryTree.new(@node)

    @big_tree = BinaryTree.new(BinaryTreeNode.new(8))
    [5,6,2,4,7,1,9].each {|num| @big_tree.push(num) }
    # Should look something like this:
    # 
    #             8
    #         5      9
    #      2     6   
    #    1   4     7
    #          
    # 
  end

  describe "when initialized" do 
    it "will have a nil head by default" do 
      expect(BinaryTree.new.head).to eq(nil)
    end

    it "will accept a node as a head argument" do 
      expect(@tree.head).to eq(@node)
    end
  end

  describe "when push is called" do 
    it "will insert a node" do 
      @tree.push(6)
      @tree.push(4)
      expect(@tree.head.right.data).to eq(6)
      expect(@tree.head.left.data).to eq(4)
    end

    it "will insert a node if head is nil" do 
      new_tree = BinaryTree.new
      new_tree.push(5)
      expect(new_tree.head.data).to eq(5)
    end
  end

  describe "when traverse methods are called" do 
    it "traverse will pull the items in order" do 
      results = []
      @big_tree.traverse {|node| results.push(node.data) }
      expect(results).to eq([1, 2, 4, 5, 6, 7, 8, 9])
    end

    it "pre_traverse will return pre-dominated data" do 
      results = []
      @big_tree.pre_traverse {|node| results.push(node.data) }
      expect(results).to eq([8, 1, 2, 4, 5, 6, 7, 9])
    end

    it "post_traverse will return post-dominant data" do 
      results = []
      @big_tree.post_traverse {|node| results.push(node.data) }
      expect(results).to eq([1, 2, 4, 5, 6, 7, 9, 8])
    end
  end

  describe "when search methods are called" do 
    it "depth_first_search will find a matching node" do 
      expect(@big_tree.depth_first_search(9).data).to eq(9)
    end

    it "depth_first_search will return nil if no match" do
      expect(@big_tree.depth_first_search(890)).to eq(nil)
    end

    it "breadth_first_search will return a match" do 
      expect(@big_tree.breadth_first_search(7).data).to eq(7)
    end  


    it "breadth_first_search will return nil if no match" do 
      expect(@big_tree.breadth_first_search(890)).to eq(nil)
    end        
  end

  describe "when length is called" do 
    it "wil return the total number of nodes" do 
      expect(@big_tree.length).to eq(8)
    end

    it "will return left_length" do 
      expect(@big_tree.left_length).to eq(6)
    end

    it "will return right_length" do 
      expect(@big_tree.right_length).to eq(2)
    end
  end

  describe "when sum is called" do 
    it "will return a sum of the node data" do 
      expect(@big_tree.sum).to eq(42)
    end
  end


end