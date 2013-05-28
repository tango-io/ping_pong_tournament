class Api::MatchController < ApplicationController
  def show
    @match = Match.find(1)

    respond_to do | format |
      format.json { render json: { match: @match } }
    end
  end
end
