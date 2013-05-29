require 'spec_helper'

describe Api::RoundController do
  def create_json round
    array = []

    round.matches.each do | match |
      team_array = [] 

      match.teams.each do | team |
        temp = { team: { id: team.id,
          name: team.name,
          picture: {:small=>"team_picture_small.png", :normal=>"team_picture_normal.png", :big=>"team_picture_big.png"}
        }}

        team_array << temp
      end

      match = { 
        id: match.id,
        match_number: match.match_number,
        teams: team_array
      }

      array << { match: match }
    end

    return array
  end

  it "should retrieve the round matches and his teams" do
    round = MatchRound.final
    round.matches.each do |match|
      2.times do
        match.teams << FactoryGirl.build(:team, picture: { small: "team_picture_small.png", normal: "team_picture_normal.png", big: "team_picture_big.png"})
      end
    end

    expected_json = {
      matches: create_json(round)
    }.to_json

    get :show, id: round.id, format: :json

    response.body.should == expected_json
  end
end
