require 'spec_helper'

describe Player do

  describe "an invalid player" do
    let(:player) { FactoryGirl.build(:invalid_player) }

    it "should raise error if player name type_account and/or user_account is/are not defined" do
      player.save
      player.errors[:name].should include("can't be blank")
      player.errors[:type_account].should include("can't be blank")
      player.errors[:user_account].should include("can't be blank")
    end

  end


  describe "a valid player" do
    let(:player) { FactoryGirl.build(:valid_player, picture_url: { small: "profile_picture_small.png", normal: "profile_picture_normal.png", big: "profile_picture_big.png"}) }

    it "should get the profile picture url when you called the method picture_url" do
      player.picture_url[:small].should  == "profile_picture_small.png"
      player.picture_url[:normal].should == "profile_picture_normal.png"
      player.picture_url[:big].should    == "profile_picture_big.png"
    end

  end

end
