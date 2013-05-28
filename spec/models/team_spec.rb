require 'spec_helper'

describe Team do

  describe "an invalid team" do
    let(:team) { FactoryGirl.build(:invalid_team) }

    it "should raise error if player name is not defined" do
      team.save
      team.errors[:name].should include("can't be blank")
    end

  end

  describe "creation of a valid team" do
    let(:team) { FactoryGirl.build(:valid_team) }

    it "should return the name of the team" do
      team.save.should be(true)
    end

  end

  describe "a valid team with multiple players on it" do
    let(:team) { FactoryGirl.create(:team_with_players) }

    it "should return the players related with the team" do
      team.players.first.name.should == Player.first.name
    end

  end

end
