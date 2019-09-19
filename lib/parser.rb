require_relative 'robot'

class Parser

  def initialize(table)
    @table = table
  end

  def parse(command)
    split_command = command.split(" ")
    robot_name = split_command[0]
    action = split_command[1]

    return if @table.robots_list[robot_name].nil? && action != "PLACE"
    case action
    when "PLACE"
      params = split_command[2].split(",")
      return if params.length != 3
      place_robot(*params, robot_name)
    when "MOVE"
      move_robot(robot_name)
    when "RIGHT"
      turn_right(robot_name)
    when "LEFT"
      turn_left(robot_name)
    when "REPORT"
      robot = @table.robots_list[robot_name]
      puts robot.name_current_position_string
    end
  end

  def robot_by_name(robot_name)
    return @table.robots_list[robot_name]
  end

  def place_robot(*params, robot_name)
    return unless @table.is_valid_position?(params[0].to_i, params[1].to_i)
    unless @table.robot_placed(robot_name)
      robot = Robot.new(*params, robot_name)
      @table.place_robot(robot)
    else
      robot.place_at(*params)
    end
  end

  def move_robot(robot_name)
    robot = robot_by_name(robot_name)
    cur_x = robot.x_point
    cur_y = robot.y_point
    cur_direction = robot.f_direction
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
    robot.place_at(next_x, next_y, cur_direction)
  end

  def turn_left(robot_name)
    left_results = {
      "NORTH": "WEST",
      "WEST": "SOUTH",
      "SOUTH": "EAST",
      "EAST": "NORTH"
    }
    robot = robot_by_name(robot_name)
    robot.f_direction = left_results[robot.f_direction.to_sym]
  end

  def turn_right(robot_name)
    right_results = {
      "NORTH": "EAST",
      "WEST": "NORTH",
      "SOUTH": "WEST",
      "EAST": "SOUTH"
    }
    robot = robot_by_name(robot_name)
    robot.f_direction = right_results[robot.f_direction.to_sym]
  end
end
