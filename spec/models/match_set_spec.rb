require 'spec_helper'

describe MatchSet do
  let(:match) { FactoryGirl.create(:match) }

  before(:each) do
    match.start
    @set = match.sets.first
  end

  context "should have" do
    it "a match" do
      @set.match.should_not be_nil
    end

    it "a winner team" do
      team = match.teams.first
      set = match.sets.first

      set.scores.first.update_attributes(total: 11)
      set.scores.last.update_attributes(total: 3)

      set.set_winner

      set.reload
      set.winner.should == team
    end
  end
end
