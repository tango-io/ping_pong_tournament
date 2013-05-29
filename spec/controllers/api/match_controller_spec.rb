require 'spec_helper'

describe Api::MatchController do
  let(:match) { FactoryGirl.create(:match) }

  it "should set score for each match set" do
    match.start
    match.sets.first.scores.first.total.should == 0
    match.sets.first.scores.last.total.should == 0
  end

end
