require 'spec_helper'

describe Api::MatchController do
  it "should give the list of matches for a round" do
    @expected_matches = { matches: MatchRound.where(number: 1).shift.matches }.to_json
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
