class Api::RoundController < ApiController
  include ActionView::Helpers::AssetTagHelper
  expose(:matches) { MatchRound.find_by(number: params[:id]).matches }

  def show
    @champion = MatchRound.final.matches.first.have_winner
  end
end
