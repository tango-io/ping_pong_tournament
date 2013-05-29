class Player < ActiveRecord::Base

  validates_presence_of :name, :type_account, :user_account, :email

  serialize  :picture_url
  belongs_to :team

end
