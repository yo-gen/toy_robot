# toy_robot

STEPS TO RUN

Get into the root folder and run
 ruby robot_sim.rb

Once the program is running you can pick commands as per the problem and get output.
You can type exit anytime to stop the program.

Some Test Cases

1. Ignoring all commands before valid place command

Input:

ALERT
HI
HEY
REPORT
PLACE
MOVE
LEFT RIGHT
RIGHT

Output: Nothing. As no valid place command is passed

2. Full Clockwise and opposite Round

Input:
PLACE 0,0,NORTH
REPORT
RIGHT
REPORT
RIGHT
REPORT
RIGHT
REPORT
RIGHT
REPORT
LEFT
REPORT
LEFT
REPORT
LEFT
REPORT
LEFT
REPORT

Output
0,0,NORTH
0,0,EAST
0,0,SOUTH
0,0,WEST
0,0,NORTH
0,0,WEST
0,0,SOUTH
0,0,EAST
0,0,NORTH

3. Moves till max and stop after table size
Input:

PLACE 0,0,EAST
MOVE
REPORT
MOVE
REPORT
MOVE
REPORT
MOVE
REPORT
MOVE
REPORT
MOVE
REPORT
MOVE
REPORT

Output:
1,0,EAST
2,0,EAST
3,0,EAST
4,0,EAST
4,0,EAST
4,0,EAST

4. Move from origin to other extreme, top right corner and after that only change directions
Input:

PLACE 0,0,NORTH
REPORT
MOVE
RIGHT
MOVE
REPORT
LEFT
MOVE
REPORT
RIGHT
MOVE
REPORT
LEFT
MOVE
REPORT
RIGHT
MOVE
REPORT
LEFT
MOVE
REPORT
RIGHT
MOVE
REPORT
LEFT
MOVE
REPORT
RIGHT
MOVE
REPORT
LEFT
MOVE
REPORT

Output:

0,0,NORTH
1,1,EAST
1,2,NORTH
2,2,EAST
2,3,NORTH
3,3,EAST
3,4,NORTH
4,4,EAST
4,4,NORTH
4,4,EAST


5. Random

Input:

PLACE 1,1,NORTH
MOVE
LEFT
MOVE
LEFT
REPORT

Output:
0,2,SOUTH
