class TowersOfHanoi

  attr_accessor :stack1, :stack2, :stack3, :pieces

  def initialize
    @stack1 = []
    @stack2 = []
    @stack3 = [5, 4, 3, 2, 1]
  end

  def move(stack1, stack2)
    raise "Stack is empty" if stack1.empty?
    raise "Larger than top piece in stack" if stack1[-1] > stack2[-1]
    stack2.push(stack1.pop) 
  end


end