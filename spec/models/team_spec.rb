require 'spec_helper'

describe Team do

  it "should raise error if player name is not defined" do
    @team = Team.create

    @team.errors[:name].should include("can't be blank")
  end

  it "should return the players related with the team" do
    @team = Team.create(name: "test_team")
    @team.players.create(name: "Test 1", type_account: "test_account", user_account: "user_account", picture_url: { small: "profile_picture_small.png", normal: "profile_picture_normal.png", big: "profile_picture_big.png"})
    @team.players.create(name: "Test 2", type_account: "test_account", user_account: "user_account", picture_url: { small: "profile_picture_small.png", normal: "profile_picture_normal.png", big: "profile_picture_big.png"})

    @team.players.first.name.should == Player.first.name
    @team.players.last.name.should  == Player.last.name
  end

end
