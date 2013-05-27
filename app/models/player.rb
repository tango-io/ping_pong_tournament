class Player < ActiveRecord::Base

  validates_presence_of :name, :type_account, :user_account

  serialize :picture_url, Hash

end
