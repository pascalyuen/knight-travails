# frozen_string_literal: true

# Class for the gameboard
class Gameboard
  def initialize(array = Array.new(8) { Array.new(8) })
    @array = array
  end
end
