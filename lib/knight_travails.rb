# frozen_string_literal: true

require_relative 'gameboard'
require_relative 'knight'

# Shows the shortest possible way to get from one square to another
# By outputting all squares the knight will stop on along the way
def knight_moves(src, dst)
  return unless src[0].between?(0, 8) && src[1].between?(0, 8) && dst[0].between?(0, 8) && dst[1].between?(0, 8)

  gameboard = Gameboard.new
  knight = Knight.new(src)
  graph = build_graph(src)
  puts "Graph: #{graph}"
end

def build_graph(square)
  graph = {}
  graph[square] = []
  graph
end

def possible_moves(square)
  array = possible_coordinates(square)
  array.permutation(2).to_a
end

def possible_coordinates(square)
  x = square[0]
  y = square[1]
  array = build_next_moves(x)
  array = build_next_moves(y, array) unless x == y
  array
end

def build_next_moves(element, array = [])
  array << element - 1 unless (element - 1).negative?
  array << element + 1 unless element + 1 > 8
  array << element - 2 unless (element - 2).negative?
  array << element + 2 unless element + 2 > 8
end

knight_moves([3, 3], [4, 3])
