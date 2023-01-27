# frozen_string_literal: true

require_relative 'knight'

def knight_moves(src, dst)
  current = Knight.new(src)
  queue = []
  visited = []
  until current.location == dst
    return if visited.include?(current)

    visited << current
    current.children.each { |element| queue << element }
    current = queue.shift
  end
  print_history(current)
end

def print_history(knight)
  print_history(knight.parent) unless knight.parent.nil?
  p knight.location
end

knight_moves([3, 3], [4, 3])
