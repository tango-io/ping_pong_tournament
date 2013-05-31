namespace :admin_user do
  desc "creates the admin user"
  task :create => :environment do
    begin
      user = User.new(
        email: "admin@localhost.com",
        password: '123tango321',
        password_confirmation: '123tango321'
      )
      if user.save
        puts "Admin user created."
      end
    rescue ActionView::Template::Error
      puts "There was a problem creating #{ name }!"
    end
    user.save
  end
end
