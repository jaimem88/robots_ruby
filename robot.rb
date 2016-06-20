class Robot
  DIRECTIONS = ['NORTH','SOUTH','EAST','WEST']
  attr_accessor :x, :y, :direction
    def initialize(x,y,direction)
      raise ArgumentError.new("Use one of NORTH, SOUTH, EAST or WEST") unless DIRECTIONS.include?(direction)
      @x = x
      @y = y
      @direction = direction
    end

    def move(x,y,direction)
      if DIRECTIONS.include?(direction) then

      else
        puts "Invalid direction #{direction}"
      end
    end
end
