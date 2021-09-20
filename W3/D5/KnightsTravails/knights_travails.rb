require_relative "../PolyTreeNode/lib/00_tree_node.rb"

class KnightPathFinder
  def build_move_tree(root_node)
    #When do we stop building the tree?
    queue = new_move_positions(root_node)
    until queue.empty?
      queue.first 
    end 
  end



  def initialize(starting_pos)
    @starting_pos = starting_pos
    @considered_positions = [starting_pos]
    @root_node = PolyTreeNode.new(starting_pos)
    self.build_move_tree(@root_node)
  end

  def new_move_positions(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    valid_moves.each do |move|
      if !@considered_positions.include?(move)
        @considered_positions << move
      end
    end
    @considered_positions
  end

  def self.valid_moves(pos)
    knight_moves = [[1,2], [2,1], [-1, 2], [-2,1], [1,-2], [2,-1], [-2,-1], [-1,-2]]
    valid_moves = []
    knight_moves.each do |move|
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