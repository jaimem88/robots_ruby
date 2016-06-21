# Author: Jaime Martinez
# Contact: jaime.martinez88@gmail.com
# Date:  June 21, 2016

# Robot has x,y and direction attributes
# A robot can move forward, turn left,right and report its position on the board
class Robot
  DIRECTIONS = ['NORTH','SOUTH','EAST','WEST']
  attr_accessor :x, :y, :direction
    def initialize(x,y,direction)
      raise ArgumentError.new("Use one of NORTH, SOUTH, EAST or WEST") \
        unless DIRECTIONS.include?(direction)
      @x = x
      @y = y
      @direction = direction
    end
    # Check if direction is valid
    def self.isDirectionValid(dir)
      return DIRECTIONS.include?(dir)
    end

    ## Move robot forward in the facing direction
    ## ignore if new position is invalid
    def move(board)
      dir = self.direction
      x = self.x
      y = self.y
      if dir == 'NORTH' then
        if board.isValidPosition(x,y+1) then
          self.y = y+1
        end
      elsif dir == 'WEST' then
        if board.isValidPosition(x-1,y) then
          self.x = x-1
        end
      elsif dir == 'SOUTH' then
        if board.isValidPosition(x,y-1) then
          self.y = y-1
        end
      elsif dir == 'EAST' then
        if board.isValidPosition(x+1,y) then
          self.x = x+1
        end
      end

    end

    ## Turn robot left
    def left()
      dir = self.direction
      if dir == 'NORTH' then
        self.direction = 'WEST'
      elsif dir == 'WEST' then
        self.direction = 'SOUTH'
      elsif dir == 'SOUTH' then
        self.direction = 'EAST'
      elsif dir == 'EAST' then
        self.direction = 'NORTH'
      end
    end

    ## Turn robot right
    def right()
      dir = self.direction
      if dir == 'NORTH' then
        self.direction = 'EAST'
      elsif dir == 'EAST' then
        self.direction = 'SOUTH'
      elsif dir == 'SOUTH' then
        self.direction = 'WEST'
      elsif dir == 'WEST' then
        self.direction = 'NORTH'
      end
    end
    
    # Returns string of the current robot position
    def report()
      return "#{self.x},#{self.y},#{self.direction}"
    end
end
