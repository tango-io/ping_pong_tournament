class ApiController < ApplicationController
  before_filter :authenticate_user!
  layout false
end
