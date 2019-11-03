RSpec.describe LinkedListNode do

  before(:example) do 
    @node1 = LinkedListNode.new(1)
    @node2 = LinkedListNode.new(2, @node1)
    @node3 = LinkedListNode.new(3, @node2)
  end

  describe 'LinkedListNode' do
    describe "initializes" do 
      it 'with expected default arguments' do
        expect(@node1.value).to eq(1)
        expect(@node1.pointer).to eq(nil)
      end

      it "with node passed as argument" do 
        expect(@node3.pointer).to eq(@node2)
        expect(@node2.pointer).to eq(@node1)
      end
    end

    describe "end? responds correctly when" do 
      it "end of the linked list" do 
        expect(@node1.end?).to eq(true)
      end

      it "not the end of the linked list" do 
        expect(@node2.end?).to eq(false)
        expect(@node3.end?).to eq(false)     
      end
    end
  end

end