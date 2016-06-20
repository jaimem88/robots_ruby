require_relative './board'
class Robot
  def initialize(position)
    @position = position
  end

  def getPosition
    puts "My Position is #{@position}"
  end
end
