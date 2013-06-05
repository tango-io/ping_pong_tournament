class Api::ScoreController < ApiController
  expose(:score)

  def set_score 
    scores = params["set"]["scores"]
    scores.each do | param |
      score = Score.find(param["id"])
      total = param["total"]
      total = 0 if total == nil
      score.update_attributes(total: total)
    end

    set = MatchSet.find(params["set"]["id"])
    match = set.match

    set.set_winner

    match.match_winner if match.have_winner

    respond_to do | format |
      format.json { render json: { status: 202 } }
    end
  end
end
