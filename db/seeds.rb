10.times do
  username = Faker::Internet.user_name
  password = Faker::Internet.password(8, 16)
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(username: username, password: password, password_confirmation: password, first_name: first_name, last_name: last_name)
end
