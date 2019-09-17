class Robot
  attr_accessor :x_point, :y_point, :f_direction

  def initialize(x_point, y_point, f_direction)
    @x_point = x_point.to_i
    @y_point = y_point.to_i
    @f_direction = f_direction
  end

  def place_at(x_point, y_point, f_direction)
    @x_point = x_point.to_i
    @y_point = y_point.to_i
    @f_direction = f_direction
  end

  def current_position_string
    return "#{@x_point},#{@y_point},#{@f_direction}"
  end
end
