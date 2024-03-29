class Robot
  attr_reader :x_point, :y_point, :name
  attr_accessor :f_direction

  def initialize(x_point, y_point, f_direction, name)
    validate_direction_value(f_direction)
    @x_point = x_point.to_i
    @y_point = y_point.to_i
    @f_direction = f_direction
    @name = name
  end

  def place_at(x_point, y_point, f_direction)
    validate_direction_value(f_direction)
    @x_point = x_point.to_i
    @y_point = y_point.to_i
    @f_direction = f_direction
  end

  def name_current_position_string
    return "#{@name} #{@x_point},#{@y_point},#{@f_direction}"
  end

  #For validation of directions
  def validate_direction_value(f_direction)
    raise StandardError unless ["NORTH", "SOUTH", "EAST", "WEST"].include?(f_direction)
  end
end
