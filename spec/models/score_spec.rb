require 'spec_helper'

describe Score do
  before(:each) do
    @set = Match.first.match_sets.create
    @score = @set.scores.create(total: 7)
  end

  context "should" do
    it "have a score" do
      @score.total.should == 7
    end

    it "have a relation with a set " do
      @score.match_set.should_not be_nil
    end

    it "belong to a team" do
      pending
    end
  end
end
