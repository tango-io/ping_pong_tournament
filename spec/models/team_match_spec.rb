require 'spec_helper'

describe TeamMatch do
  before(:each) do
    @team_match = Match.first.team_matches.create
  end

  it "should have a team" do
    pending
  end

  it "should have a match" do
    @team_match.match.should_not be_nil
  end
end
