class Api::TeamsController < ApplicationController
  layout false

  expose(:teams)
  expose(:team)

  def index
    render json: teams
  end

  def show
  end

  def create
    team = Team.new(team_params)
    if team.save
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

end
