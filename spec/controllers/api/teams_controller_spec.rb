require 'spec_helper'

describe Api::TeamsController do

  describe "team requests" do
    let(:team) { FactoryGirl.build(:team, picture: { small: "team_picture_small.png", normal: "team_picture_normal.png", big: "team_picture_big.png"}) }

    it "returns the team with the id specified" do
      team.save

      get :show, id: 1, format: :json
      JSON.parse(response.body)["id"].should == 1
    end

    it "returns the correct message when a team was created" do
      team_attributes    = team.attributes
      team_attributes.merge!(players: [team.players.first.attributes, team.players.last.attributes])
      post :create, { team: team_attributes }, format: :json

      JSON.parse(response.body)["message"].should == "The Team was successfully created"
    end

    it "returns the correct message when a team was not created" do
      team_attributes    = team.attributes
      team_attributes.merge!(players: [team.players.first.attributes.reject!{|k| k == "name" }, team.players.last.attributes])
      post :create, { team: team_attributes }, format: :json

      JSON.parse(response.body)["message"].should == "The Team was not created"
    end


  end

end
