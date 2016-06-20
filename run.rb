require_relative './board'
require_relative './robot'
VALID_COMMANDS = ['PLACE','MOVE' ,'LEFT','RIGHT','REPORT']
# class Game
#
#   def initialize(start)
#     @started = start
# end
puts "Welcome!\n"

boardSize = Board.initBoard
startedT = false
def executeCommand(instruction)
  inst = instruction.split(' ')

  cmd = inst[0]
  if cmd.length > 1  && !startedT && cmd == 'PLACE' then
    startedT = true
  elsif VALID_COMMANDS.include?(cmd) then
    if cmd == 'MOVE' then
      # Move robot
    elsif cmd == 'LEFT' then
      # turn LEFT
    elsif cmd == 'RIGHT'
      #turn RIGHT
    elsif cmd == 'REPORT'
      # REPORT status
    end
  elsif cmd == 'PLACE'
    puts "Invalid number of arguments e.g. PLACE 1,2,NORTH"
  else
    puts "Invalid command #{instruction}"
  end
end


while true do
  puts "Execute a command\n #{VALID_COMMANDS}"
  cmd = gets.chomp
  executeCommand(cmd)
end
