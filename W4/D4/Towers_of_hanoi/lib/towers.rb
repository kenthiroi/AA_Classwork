class TowersOfHanoi

  attr_accessor :stack1, :stack2, :stack3, :pieces

  def initialize
    @stack1 = []
    @stack2 = []
    @stack3 = [5, 4, 3, 2, 1]
  end

  def play
    system('clear')
    p stack1
    p stack2
    p stack3
    puts "Select a stack to move from (1, 2, 3):"
    select1 = gets.chomp.to_i
    puts "Select a stack to move to (1, 2, 3):"
    select2 = gets.chomp.to_i

    case select1
    when 1
      select1 = stack1
    when 2
      select1 = stack2
    when 3
      select1 = stack3
    end

    case select2
    when 1
      select2 = stack1
    when 2
      select2 = stack2
    when 3
      select2 = stack3
    end

    move(select1, select2)

    return "Good job" if won?
    play if !won?
  end

  def move(stack1, stack2)
    raise "Stack is empty" if stack1.empty?
    if !stack2.empty?
      raise "Larger than top piece in stack" if stack1[-1] > stack2[-1]
    rescue
    end
    stack2.push(stack1.pop) 
  end

  def won?
    if stack1[0] == stack1.length && stack2.empty? && stack3.empty?
      return true
    end
    false
  end

end

t = TowersOfHanoi.new
t.play