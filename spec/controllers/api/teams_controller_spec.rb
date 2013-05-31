require 'spec_helper'

describe Api::TeamsController do


  describe "team json requests" do
    let(:team) { FactoryGirl.build(:team) }

    it "returns a team with the id specified" do
      team.save
      get :show, { id: team.id, format: :json, team: team }

      players = []
      team.players.each do | player |
        temp = {
          user_account: player.user_account,
          type_account: player.type_account,
          picture_url: player.picture_url
        }

        players << temp
      end

      attributes = {} 
      team.attributes.each do | name, value |
          attributes[name.to_sym] = value
      end
      attributes[:players] = players

      expected_json = {
        team: attributes 
      }.to_json

      response.body.should == expected_json
    end

    context 'With the correct message' do
      it "returns the correct message when a team was created" do
        team_attributes = { name: team.name, picture: team.picture, players_attributes: [team.players.first.attributes, team.players.last.attributes] }
        post :create, { team: team_attributes }, format: :json

        JSON.parse(response.body)["message"].should == "The Team was successfully created"
        Team.last.players.count.should == 2
        
        Team.last.matches.last.match_round_id.should == 1
      end

      it "returns the correct message when a team was not created" do
        team_attributes    = team.attributes
        team_attributes.merge!(players_attributes: [team.players.first.attributes.reject!{|k| k == "name" }, team.players.last.attributes])
        post :create, { team: team_attributes }, format: :json

        JSON.parse(response.body)["message"].should == "The Team was not created"
      end

      it "returns the correct message when a team is deleted" do
        team.save

        Team.count.should == 1
        delete :destroy, { :id => team.id, :format => :json, team: team}
        Team.count.should == 0
        JSON.parse(response.body)["message"].should == "The Team was successfully deleted"
      end

    end
    
  end

end
