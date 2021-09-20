require_relative "../PolyTreeNode/lib/00_tree_node.rb"
require 'byebug'

class KnightPathFinder

  def build_move_tree(root_node)
    #When do we stop building the tree?
    root_node = PolyTreeNode.new(root_node)
    
    
    #build a queue of children
    #shovel @considered positions

    # possible_moves = KnightPathFinder.valid_moves(root_node.value)
    # queue = [root_node]
    # @considered_positions << root_node.value
    # possible_moves.each do |move|
    #   # debugger
    #   @considered_positions << move
    #   move = PolyTreeNode.new(move)
    #   queue.first.add_child(move)
    #   queue << move
    #   queue.last.parent = queue.first
    # end
    # until queue.length == 64
    #   i = 0
    #   while i < queue.length
    #     #debugger if queue[i].value.class != [].class
    #     possible_moves = KnightPathFinder.valid_moves(queue[i].value)
    #     possible_moves.each do |move|
    #       if !@considered_positions.include?(move)
    #         move = PolyTreeNode.new(move)
    #         queue[i].add_child(move)
    #         queue << move 
    #         queue.last.parent = queue[i]
    #         @considered_positions << move.value
    #       end
    #     end
    #     i += 1
    #   end
    # end
    # queue
  end

  def initialize(starting_pos)
    @starting_pos = starting_pos
    @considered_positions = [starting_pos]
    @root_node = PolyTreeNode.new(starting_pos)
    self.build_move_tree(@root_node)
  end

  def new_move_positions(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    new_arr = []
    valid_moves.each do |move|
      if !@considered_positions.include?(move)
        @considered_positions << move
        new_arr << move
      end
    end
    new_arr 
  end

  def self.valid_moves(pos)
    knight_moves = [[1,2], [2,1], [-1, 2], [-2,1], [1,-2], [2,-1], [-2,-1], [-1,-2]]
    valid_moves = []
    knight_moves.each do |move|
      #debugger if pos.value.class != [].class
      move_row = move.first + pos.first
      move_col = move.last + pos.last
      if move_row <= 8 && move_row >= 0 && move_col <= 8 && move_col >= 0
        valid_moves
        valid_moves << [move_row, move_col]
      end
    end
    valid_moves
  end

end