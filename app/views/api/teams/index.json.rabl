collection teams
attributes :id, :name, :picture
child(:players) { attributes :type_account, :user_account, :email, :picture_url, :team_id }
