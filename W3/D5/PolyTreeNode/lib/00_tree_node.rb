require 'byebug'

class PolyTreeNode

  attr_reader :value, :parent, :children

  def initialize(value)
    @children = []
    @value = value
    @parent = nil
  end

  def parent=(parent)
    #debugger
    if self.parent 
      self.parent.children.delete(self)
    end
    @parent = parent
    @parent.children << self if parent && !@parent.children.include?(self)
  end

  def add_child(child)
   child.parent = self
  end

  def remove_child(child)
    #if the parent node doesn't have that child, return an error
    if !self.children.include?(child)
      raise "Node is not a child"
    end
    child.parent = nil
  end

  # queue = Array.new
  # queue.concat(self.children)
  # i = 0
  # while i < self.children.length - 1
  #   # debugger
  #   until queue[i].children.empty?
  #     return queue[i] if queue[i].value == target
  #     queue.unshift(queue[i].children)
  #   end
  #   queue[1].children.times do 
  #     possible_target = queue.shift
  #     if target == possible_target.value 
  #       return possible_target
  #     end
  #   end
  #   i += 1
  # end
  # nil

  def dfs(target)
    return self if self.value == target
    #debugger
    
    left = self.children[0].dfs(target) if self.children[0]
    right = self.children[1].dfs(target) if self.children[1] && left.nil?

    left or right 
  end

  def bfs(target)
    return self if self.value == target

    queue = Array.new
    queue.push(self.children.first)
    queue.push(self.children.last)
    until queue.empty?
      return queue.first if queue.first.value == target
      if queue.first.children
        queue.concat(queue.first.children)
      end
      queue.shift
    end
    nil
  end
end