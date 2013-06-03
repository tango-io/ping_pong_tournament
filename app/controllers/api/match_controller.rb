class Api::MatchController < ApiController
  expose(:match)

  def show
  end

  def clear_space
    Match.find(params[:id]).cancel_match
    respond_to do | format |
      format.json { render json: { status: 202 } }
    end
  end
end
