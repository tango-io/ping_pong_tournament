class Score < ActiveRecord::Base
  validates_presence_of :match_set, :position
  #validates_presence_of :team

  belongs_to :match_set
  belongs_to :team

  default_scope order('position ASC')
end
