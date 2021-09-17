class PolyTreeNode

  attr_reader :value, :parent, :children

  def initialize(value)
    @children = []
    @value = value
    @parent = nil
  end

  def parent=(parent)
    @parent = parent
    parent.children << self if !parent
  end

  def add_child(child)

  end
end