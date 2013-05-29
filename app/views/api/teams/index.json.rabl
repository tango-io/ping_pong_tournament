collection teams
attributes :id, :name, :picture
child(:players) { attributes :name, :type_account, :user_account, :email, :picture_url, :team_id }
