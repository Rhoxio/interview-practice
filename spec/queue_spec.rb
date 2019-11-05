RSpec.describe CustomQueue do

  before(:example) do 
    @queue = CustomQueue.new
    @queue.enqueue(1)
    @queue.enqueue(2)
  end

  describe "when initialized" do 
    it "will have a nil head by default" do 
      expect(CustomQueue.new.head).to eq(nil)
    end

    it "will have a nil tail by default" do 
      expect(CustomQueue.new.tail).to eq(nil)
    end
  end

  describe "when enqueue is called" do 
    it "will set the head if it is nil" do 
      queue = CustomQueue.new
      queue.enqueue(1)
      expect(queue.head.value).to eq(1)
    end

    it "will set the tail if the head is set" do 
      expect(@queue.tail.value).to eq(2)
      expect(@queue.head.value).to eq(1)
    end

    it "will link the head to the tail" do 
      expect(@queue.head.pointer.value).to eq(2)
    end

    it "will append to the tail correctly" do 
      @queue.enqueue(3)
      expect(@queue.tail.value).to eq(3)
      expect(@queue.head.pointer.value).to eq(2)
      expect(@queue.head.value).to eq(1)
    end
  end

  describe "when dequeue is called" do 
    it "dequeues the appropriate value" do 
      expect(@queue.dequeue).to eq(1)
      expect(@queue.dequeue).to eq(2)
    end
  end

  describe "when empty? is called" do 
    it "the queue is empty" do 
      expect(CustomQueue.new.empty?).to eq(true)
    end
  end

  describe "when reverse is called" do 
    it "will reverse the queue" do 
      expect(@queue.reverse.head.value).to eq (2)
    end
    
  end
end