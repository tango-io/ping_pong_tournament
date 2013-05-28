require 'spec_helper'

describe Team do

  describe "an invalid team" do
    let(:team) { FactoryGirl.build(:invalid_team) }

    it "should raise error if player name is not defined" do
      team.save
      team.errors[:name].should include("can't be blank")
    end

  end

  describe "a valid team" do
    let(:team) { FactoryGirl.build(:valid_team) }

    it "should return the name of the team" do
      team.save
      team.name.should  == "Test"
      Team.count.should == 1
    end

  end

  describe "a valid team with multiple players on it" do
    let(:team) { FactoryGirl.create(:valid_team) }

    it "should return the players related with the team" do
      team.players.create(name: "Test 1", type_account: "test_account", user_account: "user_account", picture_url: { small: "profile_picture_small.png", normal: "profile_picture_normal.png", big: "profile_picture_big.png"})
      team.players.create(name: "Test 2", type_account: "test_account", user_account: "user_account", picture_url: { small: "profile_picture_small.png", normal: "profile_picture_normal.png", big: "profile_picture_big.png"})
      team.players.first.name.should == Player.first.name
      team.players.last.name.should  == Player.last.name
    end

  end

end
