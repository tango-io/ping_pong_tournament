class Api::TeamsController < ApplicationController
  respond_to :json, :xml    
  expose(:teams)
  expose(:team)

  def index
    respond_with teams: teams
  end

  def show
    respond_with team: team
  end

  def create
    team = Team.new
    team.assign_attributes(name: params["team"]["name"], picture: JSON.parse(params["team"]["picture"].to_json))

    params["team"]["players"].each do |player_attributes|
      team.players.new(player_attributes)
    end

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

end
