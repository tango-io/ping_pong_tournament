class Api::RoundController < ApplicationController
  layout "json_layout"

  expose(:matches) { MatchRound.find_by(number: params[:id]).matches }

  def show
  end
end
