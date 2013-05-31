require 'spec_helper'

describe Api::MatchController do
  let(:match) { FactoryGirl.create(:match) }

  def create_json match 
    team_array = [] 
    match_array = [] 


    match.sets.each do | set |
      score_array = [] 

      set.scores.each do | score |
        temp = { score: {
                  id: score.id,
                  total: score.total,
                  team_id: score.team_id
        }}

        score_array << temp
      end

      temp = { match_set: {
               id: set.id,
               set_number: set.set_number,
               scores: score_array
      }}

      match_array << temp
    end

    match.teams.each do | team |
      temp = {  team: { 
                id: team.id,
                name: team.name,
                picture: {}
      }}

      team_array << temp
    end

    hash = { 
      match_number: match.match_number,
      teams: team_array,
      match_sets: match_array,
    }

    return hash 
  end

  it "should retrive the information of the match, teams and scores" do
    match.start

    expected_json = {
      match: create_json(match)
    }.to_json

    get :show, id: match.id, format: :json

    response.body.should == expected_json
  end

end
