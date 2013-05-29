class Team < ActiveRecord::Base
  serialize  :picture

  validates_presence_of         :name

  has_and_belongs_to_many       :matches

  has_many                      :players

  accepts_nested_attributes_for :players

  has_many                      :scores
  has_many                      :sets, class_name: 'MatchSet'

end
