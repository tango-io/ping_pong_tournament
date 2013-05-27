require 'spec_helper'

describe Round do
  context "should have" do
    it "have a name" do
      round = Round.create
      round.errors[:name].should include("can't be blank")
    end

    it "accept a valid name" do
      round = Round.create(name: 'champion')
      round.errors[:name].should include("is not included in the list")
    end

    it "4 rounds" do
      number_of_rounds = Round.all.count
      number_of_rounds.should == 4
    end
  end

  context "respond to name" do
    it "round of 16" do
      Round.round_of_16.count.should == 1
    end

    it "quarters" do
      Round.quarters.count.should == 1
    end

    it "semifinal" do
      Round.semifinal.count.should == 1
    end

    it "final" do
      Round.final.count.should == 1
    end
  end

end
