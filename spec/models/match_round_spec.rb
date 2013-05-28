require 'spec_helper'

describe MatchRound do
  context "should have" do
    it "have a name" do
      round = MatchRound.create
      round.errors[:name].should include("can't be blank")
    end

    it "accept a valid name" do
      round = MatchRound.create(name: 'champion')
      round.errors[:name].should include("is not included in the list")
    end

    it "4 rounds" do
      number_of_rounds = MatchRound.all.count
      number_of_rounds.should == 4
    end

  end

  context "respond to name" do
    it "round of 16" do
      MatchRound.round_of_16.should_not be_nil
    end

    it "quarters" do
      MatchRound.quarters.should_not be_nil
    end

    it "semifinal" do
      MatchRound.semifinal.should_not be_nil
    end

    it "final" do
      MatchRound.final.should_not be_nil
    end
  end

end

