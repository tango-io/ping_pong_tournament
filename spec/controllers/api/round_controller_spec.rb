require 'spec_helper'

describe Api::RoundController do
  def create_json round
    array = []

    round.matches.each do | match |
      team_array = [] 

      match.teams.each do | team |
        temp = { id: team.id,
          name: team.name,
          picture: {:small=>"team_picture_small.png", :normal=>"team_picture_normal.png", :big=>"team_picture_big.png"}
        }

        team_array << temp
      end

      match_json = {} 
      match_json[:id] = match.id
      match_json[:match_number] = match.match_number
      if match.round.number == 4
        match_json[:champion] = match.have_winner
      end
      match_json[:teams] = team_array

      array << { match: match_json }
    end

    return array
  end

  it "should retrieve the round matches and his teams" do
    round = MatchRound.round_of_16
    round.matches.each do |match|
      2.times do
        match.teams << FactoryGirl.build(:team, picture: { small: "team_picture_small.png", normal: "team_picture_normal.png", big: "team_picture_big.png"})
      end
    end

    expected_json = create_json(round)

    get :show, id: round.id, format: :json

    response.body.should == expected_json.to_json
  end

  it "should retrive the final match and his winner" do
    round = MatchRound.final
    round.matches.each do |match|
      2.times do
        match.teams << FactoryGirl.build(:team, picture: { small: "team_picture_small.png", normal: "team_picture_normal.png", big: "team_picture_big.png"})
      end
    end

    expected_json = create_json(round)

    get :show, id: round.id, format: :json

    response.body.should == expected_json.to_json
  end
end
