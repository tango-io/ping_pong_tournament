class Api::ScoreController < ApiController
  expose(:score)

  def update
    score = Score.find(params[:id])
    set = score.match_set
    match = set.match
    score.update_attributes(total: params[:total])

    if set.scores.first != 0 and set.scores.last != 0
      set.set_winner
    end

    match.match_winner if match.have_winner

    if score.save
      respond_to do | format |
        format.json { render json: { status: 202 } }
      end
    end
  end
end
