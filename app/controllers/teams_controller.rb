class TeamsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:index, :show]

  expose(:teams)

  def index
  end

  def new
  end
end
