class Api::TeamsController < ApplicationController
  layout false
  skip_before_filter :verify_authenticity_token
  before_filter :fix_params_from_for, :only => [:create]

  expose(:teams)
  expose(:team)

  def index
    render json: teams
  end

  def show
  end

  def create
    match = MatchRound.round_of_16.available_matches.sample
    team = Team.new(team_params)
    if team.save
      match.teams << team
      render json: { message: "The Team was successfully created"}
    else
      render json: { message: "The Team was not created"}
    end
  end

  def destroy
    if team.delete
      render json: { message: "The Team was successfully deleted"}
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :picture, players_attributes: [:name, :type_account, :user_account, :email, :picture_url])
  end

  def fix_params_from_for
    if params[:team][:players_attributes].first.class == "Array"
    p = params["team"]["players_attributes"].to_a
    params["team"][:players_attributes] = [p[0][1], p[1][1]]
    end
  end

end
