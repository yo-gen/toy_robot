puts "This is a Toy Robot Simulator"
puts "Enter exit to end and restart to play again"

command = ""

while(command != "exit" && command != restart)
  command = gets()

  parser = Parser.new()

  parser.parse(command)
end
