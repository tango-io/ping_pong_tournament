require 'spec_helper'

describe Api::TeamsController do

  describe "team requests" do
    let(:team) { FactoryGirl.build(:team) }

    it "returns the team with the id specified" do
      team.save
      puts team.inspect
      #@team = { team: Team.last, players: Team.last.players }.to_json
      Rabl::Renderer.json(team, 'api/teams/show', :view_path => 'app/views', :format => :json)

      #get :show, id: 1, format: :json

      #response.body.should == @team
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
