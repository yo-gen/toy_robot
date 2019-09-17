class SquareTable
  attr_reader :robot_placed

  def initialize(size)
    @size = size
    @robot_placed = false
  end

  def is_valid_position?(x,y)
    if x >= 0 && x < @size && y >= 0 && y < @size
      return true
    else
      return false
    end
  end

  def place_robot
    @robot_placed = true
  end
end
