require_relative './board'
require_relative './robot'

puts "Welcome!\n"

boardSize = Board.initBoard
r = Robot.new("#{boardSize}")
r.getPosition