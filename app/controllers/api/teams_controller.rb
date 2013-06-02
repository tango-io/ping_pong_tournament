class Api::TeamsController < ApiController
  skip_before_filter :verify_authenticity_token
  before_filter :fix_params_from_for, only: :create

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
    if team.valid_team? && team.save
        match.teams << team
        match.start if match.teams.count == 2
        redirect_to "#/round/1"
    else
      redirect_to :back
    end
  end

  def destroy
    if team.delete
      render json: { message: "The Team was successfully deleted"}
    end
  end

  private
  def team_params
    params.require(:team).permit(
      :name, 
      :picture, 
      players_attributes: [
        :type_account, 
        :user_account, 
        :email, 
        :picture_url
      ]
    )
  end

  def fix_params_from_for
    if params[:team][:players_attributes].first.class == Array
      players_attributes = params["team"]["players_attributes"].to_a
      p1_attributes      = players_attributes.first.last
      p2_attributes      = players_attributes.last.last
      params["team"][:players_attributes] = [p1_attributes, p2_attributes]
    end
  end

end
