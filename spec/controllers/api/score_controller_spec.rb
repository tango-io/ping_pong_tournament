require 'spec_helper'

describe Api::ScoreController do
  let(:match) { FactoryGirl.create(:match) }

  it "should set score for each match set" do
    match.start
    set_score = match.sets.first.scores.first

    put :update, id: set_score.id, total: 11, format: :json

    set_score.reload
    set_score.total.should == 11
  end

end
