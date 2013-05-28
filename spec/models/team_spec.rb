require 'spec_helper'

describe Team do

  describe "an invalid team" do
    let!(:team) { Team.new } 

    it "should raise error if player name is not defined" do
      team.save
      team.errors[:name].should include("can't be blank")
    end

  end

  describe "creation of a valid team" do
    let(:team) { FactoryGirl.build(:team, picture: { small: "team_picture_small.png", normal: "team_picture_normal.png", big: "team_picture_big.png"}) }

    it "should return the name of the team" do
      team.save.should be_true
    end

  end

  describe "a valid team with multiple players on it" do
    let(:team) { FactoryGirl.create(:team, picture: { small: "team_picture_small.png", normal: "team_picture_normal.png", big: "team_picture_big.png"}) }

    it "should return the players related with the team" do
      team.players.first.name.should == Player.first.name
    end

  end

end
