class Api::RoundController < ApplicationController
  def show
    @matches = MatchRound.where(number: params[:id]).shift.matches

    respond_to do | format |
      format.json { render json: { matches: @matches } }
    end
  end
end
