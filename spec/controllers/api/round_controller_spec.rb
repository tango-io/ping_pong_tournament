require 'spec_helper'

describe Api::RoundController do
  it "should give the list of matches for a round" do
    @expected_matches = { matches: MatchRound.find_by(number: 1).matches }.to_json
    get :show, id: 1, format: :json
    response.body.should == @expected_matches
  end

  it "should be able to star a match" do
  end

  it "should set score for each match set" do
  end

  it "should have a winner" do
  end
end
