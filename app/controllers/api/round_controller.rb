class Api::RoundController < ApiController
  expose(:matches) { MatchRound.find_by(number: params[:id]).matches }

  def show
  end
end
