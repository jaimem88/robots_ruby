require 'spec_helper'
describe Robot do
  before :all do
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
end