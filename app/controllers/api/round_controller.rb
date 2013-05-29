class Api::RoundController < ApplicationController
  expose(:matches) { MatchRound.find_by(number: params[:id]).matches }

  def show
    respond_to do | format |
      format.json { render json: { matches: matches } }
    end
  end
end
