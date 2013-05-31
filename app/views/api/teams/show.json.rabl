object team
attributes :id, :name, :picture, :created_at, :updated_at
child :players, :object_root => false do
  attributes :user_account, :type_account, :picture_url
end
