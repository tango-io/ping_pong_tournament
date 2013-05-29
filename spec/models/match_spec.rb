require 'spec_helper'

describe Match do

  let(:round) { FactoryGirl.create(:round) }
  let(:match) { FactoryGirl.create(:match, match_round: round ) }

  context "should have" do
    it "a position" do
      match.match_number.should_not be_nil
    end

    it "3 sets once it start" do
      match.start
      match.match_sets.count.should == 3
    end

    it "a round" do
      match.match_round.should == round
    end

    it "a winner team" do
      match.start

      team = match.teams.first
      sets = match.match_sets

      sets[0].scores.first.update_attributes(total: 11)
      sets[0].scores.last.update_attributes(total: 3)

      sets[1].scores.first.update_attributes(total: 9)
      sets[1].scores.last.update_attributes(total: 11)

      sets[2].scores.first.update_attributes(total: 11)
      sets[2].scores.last.update_attributes(total: 5)

      sets.each { | set | set.set_winner }

      match.reload
      match.match_winner.should == team
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

