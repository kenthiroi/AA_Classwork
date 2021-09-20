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

  def dfs(target)
    return self if self.value == target
    queue = Array.new
    queue.concat(self.children)
    i = -1 
    while queue.length != 0
      while !queue[i].children.empty?
        p target 
        p queue[i].children
        p "second loop #{queue[i]}"
        sleep(1)
        queue << queue[i].children
      end
        if target == queue[i].value 
          return queue[i]
        else
          queue.pop
        end
    end
    nil
  end
end