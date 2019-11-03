RSpec.describe Stack do
  before(:example) do
    @stack = Stack.new
    @filled_stack = Stack.new
    @filled_stack.push(1)
    @filled_stack.push(2)
    @filled_stack.push(3)
  end

  describe 'Stack' do 
    describe 'when initialized' do
      it "will be empty" do 
        expect(@stack.head).to eq(nil)
      end

      it "will accept an argument as default head" do
        node = LinkedListNode.new(1) 
        new_stack = Stack.new(node)
        expect(new_stack.any?).to eq(true)
        expect(new_stack.head).to eq(node)
      end

      it "will not accept other object types outside if LinkedListNode" do 
        oof = 'oof'
        expect{Stack.new(oof)}.to raise_error(ArgumentError)
      end
    end

    describe "any? responds correctly when" do 
      it "is empty" do 
        expect(@stack.any?).to eq(false)
      end

      it "is not empty" do 
        @stack.push(4)
        expect(@stack.any?).to eq(true)
      end
    end

    describe "empty? responds correctly when" do 
      it "the stack is empty" do 
        expect(@stack.empty?).to eq(true)
      end

      it "the stack has data" do 
        expect(@filled_stack.empty?).to eq(false)
      end
    end

    describe "when push is called" do 
      describe "sets the head" do 
        it "is nil" do 
          expect(@stack.head).to eq(nil)
        end

        it "is not nil" do 
          @stack.push(2)
          expect(@stack.head.class).to eq(LinkedListNode)
        end
      end
    end

    describe "when pop is called" do 
      it "will return nil if stack is empty" do 
        expect(@stack.pop).to eq(nil)
      end

      it "will return the popped value" do 
        expect(@filled_stack.pop).to eq(3)
      end

      it "will set the new head" do 
        @filled_stack.pop
        expect(@filled_stack.head.value).to eq(2)
      end
    end

    describe "when reverse is called" do 
      it "will reverse the stack and return the amended one" do 
        reversed_stack = @filled_stack.reverse
        expect(reversed_stack.head.value).to eq(1)
      end
    end

    describe "when reverse! is called" do 

      it "will mutate the current stack" do
        @filled_stack.reverse!
        expect(@filled_stack.head.value).to eq(1)
      end

      it "will retain reverse ordering" do 
        @filled_stack.reverse!
        3.times {@filled_stack.pop}
        expect(@filled_stack.pop).to eq(nil)
      end

    end

    describe "when find is called" do 
      it "will return a node if a match is found" do 
        expect(@filled_stack.find(1).value).to eq(1)
      end

      it "will return false if a match is not found" do 
        expect(@filled_stack.find(89320)).to eq(false)
      end
    end

    describe "when to_a is called" do 
      it "should return an array in the correct order" do 
        expect(@filled_stack.to_a).to eq([3,2,1])
        expect(@filled_stack.reverse.to_a).to eq([1,2,3])
      end
    end

  end

end