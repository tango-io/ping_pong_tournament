class Score < ActiveRecord::Base
  validates_presence_of :total, :match_set
  #validates_presence_of :team

  belongs_to :match_set
  belongs_to :team
end
