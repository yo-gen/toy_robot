require_relative 'lib/parser'
require_relative 'lib/square_table'

table = SquareTable.new(5)
parser = Parser.new(table)

puts "This is a Toy Robot Simulator"
puts "Enter exit to end"

command = ""

while(command != "exit")
  command = gets().chomp

  parser.parse(command)
end
