require 'spec_helper'
describe Board do
  before :each do
    @board = Board.new 5
  end

  describe "#new" do
    it "returns an isntance of board " do
        expect(@board).to be_an_instance_of Board
    end
  end
  describe "#size" do
    it "returns the size of the board position" do
        expect(@board.size).to eql 5
    end
  end
  describe "#isValidPosition" do
    it "returns true if position is valid" do
        expect(@board.isValidPosition(1,1)).to eql true
    end
    it "returns false if position is not valid" do
        expect(@board.isValidPosition(10,10)).to eql false
    end
  end
end