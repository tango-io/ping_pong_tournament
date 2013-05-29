class Api::ScoreController < ApplicationController
  expose(:score)

  def update
    score.update_attributes(total: params[:total])

    if score.save
      respond_to do | format |
        format.json { render json: { status: 202 } }
      end
    end
  end
end
