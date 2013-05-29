class Match < ActiveRecord::Base
  validates_presence_of :match_number

  belongs_to :match_round

  has_and_belongs_to_many :teams

  has_many :match_sets

  def start
    if self.teams.count == 2
      3.times { |n| self.match_sets.create( set_number: n + 1 ) }
      self.match_sets.each do |set|
        2.times { 
          set.scores.create
        }
      end
    end
  end
end
