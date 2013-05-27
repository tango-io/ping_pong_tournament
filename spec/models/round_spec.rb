require 'spec_helper'

describe Round do
  context "Since the beginig ther must be" do
    it "4 rounds" do
      number_of_rounds = Round.all.map(&:round).uniq.count
      number_of_rounds.should == 4
    end

    context "each round must have" do
      it "16 places" do
        round_positions = Round.first.count
        round_positions.should == 16
      end

      it "8 places" do
        round_positions = Round.second.count
        round_positions.should == 8
      end

      it "4 places" do
        round_positions = Round.third.count
        round_positions.should == 4 
      end

      it "2 places" do
        round_positions = Round.fourth.count
        round_positions.should ==  2
      end
    end
  end

end
