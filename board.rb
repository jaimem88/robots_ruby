# Author: Jaime Martinez
# Contact: jaime.martinez88@gmail.com
# Date:  June 21, 2016

# Board class has a size attribute.
class Board
  attr_accessor :size
    def initialize(size)
      @size = size
    end
    # checks if a position in the board is valid
    def isValidPosition(x,y)
      if x < self.size && y < self.size && x >= 0 && y >= 0 then
        return true
      end
      return false
    end
end
