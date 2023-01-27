# frozen_string_literal: true

class Knight
  attr_accessor :location, :parent

  TRANSFORMATION = [[-1, -2], [-1, 2], [1, -2], [1, 2],
                    [-2, -1], [-2, 1], [2, -1], [2, 1]]

  def initialize(location, parent = nil)
    @location = location
    @parent = parent
  end

  def children
    TRANSFORMATION.map { |e| [@location[0] + e[0], @location[1] + e[1]] }
                  .keep_if { |e| e[0].between?(0, 7) && e[1].between?(0, 7) }
                  .map { |e| Knight.new(e, self) }
  end
end
