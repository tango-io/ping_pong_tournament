require 'spec_helper'

describe Match do

  before(:each) do
  end

  context "should have" do
    it "a position" do
      Match.where(match_number: 1).should_not be_nil
    end

    it "3 sets once the started" do
      Match.first.match_sets.count.should == 3
    end

    it "2 teams involved" do
      pending
    end

    it "one round" do
      Match.first.match_round.should == MatchRound.round_of_16
    end
  end

  context "should exist" do
    it "8 matches on round of 16" do
      MatchRound.round_of_16.matches.count.should == 8
    end

    it "4 matches on quarters" do
      MatchRound.quarters.matches.count.should == 4
    end

    it "2 matches on semifinals" do
      MatchRound.semifinal.matches.count.should == 2
    end

    it "1 matches on the final" do
      MatchRound.final.matches.count.should == 1
    end
  end
end

