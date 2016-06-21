require 'spec_helper'
describe Robot do
  before :each do
    @robot = Robot.new 1,2,'NORTH'
  end

  describe "#new" do
    it "returns an isntance of robot " do
        expect(@robot).to be_an_instance_of Robot
    end
  end
  describe "#x position" do
    it "returns the new robot x position" do
        expect(@robot.x).to eql 1
    end
  end
  describe "#y position" do
    it "returns the new robot y position" do
        expect(@robot.y).to eql 2
    end
  end
  describe "#direction" do
    it "returns the new robot direction" do
        expect(@robot.direction).to eql 'NORTH'
    end
  end

  describe "#report" do
    it "returns the new robot direction" do
        expect(@robot.report).to eql '1,2,NORTH'
    end
  end

  describe "#right" do
    it "returns the new robot direction" do
        @robot.right
        expect(@robot.direction).to eql 'EAST'
    end
  end
  describe "#left" do
    it "returns the new robot direction" do
      @robot.left
        expect(@robot.direction).to eql 'WEST'
    end
  end
  describe "#move" do
    it "returns the new robot direction" do
      @robot.move(Board.new(5))
        expect(@robot.y).to eql 3
    end
  end
end