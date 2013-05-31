class Player < ActiveRecord::Base

  validates_presence_of :type_account, :user_account, :email

  serialize   :picture_url
  belongs_to  :team
  before_save :set_profile_image

  def is_valid?
    account = type_account == 'twitter' ? (Twitter.users(self.user_account) rescue nil) : (Github.repos.list user: user_account rescue nil)
    return account.nil? ? false : true
  end

  def set_profile_image
    self.picture_url = type_account == 'twitter' ? (Twitter.users(user_account).first.profile_image_url) : (Github.repos.list user: user_account).to_a.first.owner.avatar_url
  end

end
