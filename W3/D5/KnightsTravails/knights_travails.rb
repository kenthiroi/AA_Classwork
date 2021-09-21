require_relative "../PolyTreeNode/lib/00_tree_node.rb"
require 'byebug'

class KnightPathFinder
  attr_reader :considered_positions
  def build_move_tree(root_node)
    #When do we stop building the tree?
    #root_node = PolyTreeNode.new(root_node)
    
    #build a queue of children
    #new_move_pos(pos) will update @considered positions and return relevant ones
    #shovel @considered positions
    #make all possible positions from the root_node and them as children to root node 
    
    all_pos = [root_node]
    #if current nodes doesn't have new_move_pos, it means it has 
    #no children, and we can move to the next node in all_pos
    i = 0 
    while all_pos.length < 64
      #debugger if not all_pos[i]
      possible_pos = new_move_positions(all_pos[i].value)
      if !possible_pos.empty?
        possible_pos.each do |move|
          temp = PolyTreeNode.new(move)
          temp.parent = all_pos[i]
          all_pos << temp
        end
      end 
      i += 1
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
      if move_row <= 7 && move_row >= 0 && move_col <= 7 && move_col >= 0
        valid_moves
        valid_moves << [move_row, move_col]
      end
    end
    valid_moves
  end

  def find_path(end_pos)
    @root_node.bfs(end_pos)
  end

  def trace_path_back(end_pos)
    path_back = []
    until end_pos.parent.nil?
      path_back << end_pos.parent.value
      path_back.concat(trace_path_back(end_pos.parent))
    end
    path_back
  end
end