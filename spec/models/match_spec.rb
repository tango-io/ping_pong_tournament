require 'spec_helper'

describe Match do

  let(:round)   { FactoryGirl.create(:round) }
  let(:match)   { FactoryGirl.create(:match, round: round ) }

  def first_team_wins_match match
    match.start
    sets = match.sets

    sets[0].scores.first.update_attributes(total: 11)
    sets[0].scores.last.update_attributes(total: 3)

    sets[1].scores.first.update_attributes(total: 9)
    sets[1].scores.last.update_attributes(total: 11)

    sets[2].scores.first.update_attributes(total: 11)
    sets[2].scores.last.update_attributes(total: 5)

    sets.each { | set | set.set_winner }
  end

  context "should have" do
    it "a position" do
      match.match_number.should_not be_nil
    end

    it "3 sets once it start" do
      match.start
      match.sets.count.should == 3
    end

    it "a round" do
      match.round.should == round
    end

    it "a winner team" do
      team = match.teams.first

      first_team_wins_match match

      match.reload
      match.match_winner.should == team
    end
  end

  it "should take the winner team to the next round" do
    match = MatchRound.round_of_16.matches.find_by(match_number: 5)
    2.times do
      match.teams << FactoryGirl.build(:team, picture: { small: "team_picture_small.png", normal: "team_picture_normal.png", big: "team_picture_big.png"})
    end

    team = match.teams.first

    first_team_wins_match match
    match.reload

    winner = match.match_winner
    next_round = MatchRound.quarters

    included = false
    next_round.matches.each do | match | 
      included = true if match.teams.include?(winner)
    end

    included.should == true
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

