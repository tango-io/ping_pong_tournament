class TeamMatch < ActiveRecord::Base
  validates_presence_of :match

  belongs_to :match
  belongs_to :team
end
