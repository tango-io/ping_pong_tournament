require 'spec_helper'

describe MatchSet do
  before(:each) do
    @set = Match.first.match_sets.create
  end

  context "should have" do
    it "a match" do
      @set.match.should_not be_nil
    end

    it "a winner team" do
      pending
    end
  end
end
