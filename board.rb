class Board
  def initialize(size)
    @size = size
  end
  def self.initBoard
    $done = false
    while !$done do
        puts "Please select the size of the board (e.g. 5):\n"
        boardSize = gets.chomp.to_i
        if boardSize > 0 then
          puts "New board size is #{boardSize}\n"
          $done = true
        else
          puts "Please use positive integer numbers greater than 0\n"
        end
    end
    return boardSize
  end
  def isValidPosition(x,y)
    if x < self.size && y < self.size then
      return true
    end
    return false
  end
end
