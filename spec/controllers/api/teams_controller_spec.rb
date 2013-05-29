require 'spec_helper'

describe Api::TeamsController do

  describe "team json requests" do
    let(:team) { FactoryGirl.create(:team) }

    it "returns a team" do
      get :show, { :id => team.id, :format => :json, team: team}

      response.body.should == { team: team }.to_json
    end

    it "returns the correct message when a team was created" do
      team_attributes = team.attributes
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

    it "returns the team with the id specified" do
      team.save

      delete :destroy, id: 1
      JSON.parse(response.body)["message"].should == "The Team was successfully deleted"
    end

  end

end
