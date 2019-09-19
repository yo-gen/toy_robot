class SquareTable
  attr_accessor :robots_list

  def initialize(size)
    @size = size
    @robots_list = {}
  end

  def is_valid_position?(x,y)
    if x >= 0 && x < @size && y >= 0 && y < @size
      return true
    else
      return false
    end
  end

  def place_robot(robot)
    @robots_list[robot.name] = robot
  end

  def robot_placed(robot_name)
    @robots_list[robot_name]
  end
end
