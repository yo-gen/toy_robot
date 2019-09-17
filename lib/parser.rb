require_relative 'robot'

class Parser

  def initialize(table)
    @table = table
  end

  def parse(command)
    split_command = command.split(" ")
    action = split_command[0]

    # return if !@table.robot_placed && action != "PLACE"
    case action
    when "PLACE"
      params = split_command[1].split(",")
      place_robot(*params)
    when "MOVE"
      move_robot()
    when "RIGHT"
      turn_right()
    when "LEFT"
      turn_left()
    when "REPORT"
      puts @robot.current_position_string
    end
  end

  def place_robot(*params)
    return unless @table.is_valid_position?(params[0].to_i, params[1].to_i)
    unless @table.robot_placed
      @robot = Robot.new(*params)
      @table.place_robot
    else
      @robot.place_at(*params)
    end
  end

  def move_robot
    cur_x = @robot.x_point
    cur_y = @robot.y_point
    cur_direction = @robot.f_direction
    if cur_direction == "NORTH"
      next_x = cur_x
      next_y = cur_y + 1
    elsif cur_direction == "SOUTH"
      next_x = cur_x
      next_y = cur_y - 1
    elsif cur_direction == "EAST"
      next_x = cur_x + 1
      next_y = cur_y
    elsif cur_direction == "WEST"
      next_x = cur_x - 1
      next_y = cur_y
    end
    return unless @table.is_valid_position?(next_x, next_y)
    @robot.x_point = next_x
    @robot.y_point = next_y
  end

  def turn_left
    left_results = {
      "NORTH": "WEST",
      "WEST": "SOUTH",
      "SOUTH": "EAST",
      "EAST": "NORTH"
    }
    @robot.f_direction = left_results[@robot.f_direction.to_sym]
  end

  def turn_right
    right_results = {
      "NORTH": "EAST",
      "WEST": "NORTH",
      "SOUTH": "WEST",
      "EAST": "SOUTH"
    }
    @robot.f_direction = right_results[@robot.f_direction.to_sym]
  end
end
