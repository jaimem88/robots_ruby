require 'spec_helper'
describe Robot do
  before :all do
    @robot = Robot.new "3,4,NORTH"
  end

  describe "#position" do
    it "returns the new robot position" do
        @robot.position.should eql "3,4,NORTH"
    end
  end
end