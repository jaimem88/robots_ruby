# Author: Jaime Martinez
# Contact: jaime.martinez88@gmail.com
# Date:  June 21, 2016
require_relative './board'
require_relative './robot'
VALID_COMMANDS = ['PLACE','MOVE' ,'LEFT','RIGHT','REPORT','EXIT']

puts "Welcome!\n"

$newBoard = nil
$started = false
$robot = nil

# executeCommand runs the specified command, ignores invalid commands
def executeCommand(instruction)
  cmd, rest = instruction.split
  cmd = cmd.upcase
  # stop program at anytime
  if cmd =='EXIT' then
    exit
  # Allow PLACE command only at the beginning of the game
  elsif !$started && cmd == 'PLACE' then #Check commands
      placeRobot(rest)
  elsif $started && VALID_COMMANDS.include?(cmd) then # Run valid commands
    if cmd == 'MOVE' then
      # Move robot
      $robot.move($newBoard)
    elsif cmd == 'LEFT' then
      # turn LEFT
      $robot.left()
    elsif cmd == 'RIGHT'
      #turn RIGHT
      $robot.right()
    elsif cmd == 'REPORT'
      # REPORT status
      puts $robot.report()
    elsif cmd =='PLACE' then
      placeRobot(rest)
    end
  else
    puts "Invalid command '#{instruction}'"
  end
end

# place a robot on the board, replaces any older robot
def placeRobot(position)
  if position.nil? then
    puts "Invalid number of arguments e.g. PLACE 1,2,NORTH"
    return
  end
  # Get next arguments
  x,y,dir = position.split(',')
  x = x.to_i      # assume x and y are Numeric types,
  y = y.to_i      # strings will be converted to 0
  dir = dir.upcase
  # Check argguments
  if x.nil? || y.nil? || dir.nil? then
    puts "Invalid number of arguments e.g. PLACE 1,2,NORTH"
  elsif $newBoard.isValidPosition(x,y) then
    if  !Robot.isDirectionValid(dir) then
      puts "Invalid direction #{dir}"
      return
    end
    $started = true
    $robot = Robot.new(x,y,dir) # => Robot object
  else
    puts "Invalid position. Board size is #{$newBoard.size}."
  end
end

# Run the game until exit command or Ctrl+C
def main()
  $init = false
  # read from terminal
  if ARGV.empty?
    while true do
      if !$init then
        # Read a number from the terminal, only first argument counts
        puts "Please select the size of the board (e.g. 5):\n"
        boardSizeStr = gets.chomp
        # exit program
        boardSize = boardSizeStr.to_i
        if boardSize == 0 && boardSizeStr.upcase =='EXIT' then
          exit
        elsif boardSize > 0  && boardSize <= 10 then
          puts "New board size is #{boardSize} x #{boardSize}\n"
          $newBoard = Board.new(boardSize)
          $init = true
        else
          puts "Please use positive integer numbers from 1 to 10\n"
          next
        end
      end
      if !$started then
        puts "Place a robot on the board! (e.g. PLACE 1,2,NORTH)\n"
      else
        puts "Availble commands #{VALID_COMMANDS}"
      end
      #Read commands from terminal
      cmd = gets.chomp
      executeCommand(cmd)
    end
  else
    # Read from file
    filename = ARGV[0]
    if File.file?(filename) then  # check if file exists
      f = File.open(filename, "r")
      f.each_line do |line|
        puts line
        if line == "" || line == "\n" then
          next
        elsif !$init then
          boardSize = line.to_i
          $newBoard = Board.new(boardSize)
          $init = true
        else
          executeCommand(line)
        end
      end
      f.close
    else
      puts "File '#{filename}' doesn't exist. Try again."
      exit
    end
  end
end
# Run main program
main()
