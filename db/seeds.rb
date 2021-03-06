# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Jake Nildo Giangan",
            email: "jake@email.com",
            password: "password",
            password_confirmation: "password")

99.times do |n|
    name = Faker::Name.name
    email = "username#{n+1}@email.com"
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
end

users = User.order(:created_at).take(7)
50.times do
    content = Faker::Games::Pokemon.move
    users.each { |user| user.microposts.create!(content: content) }
end


users = User.all
user = users.first
following = users[2..50]
following = users[3..40]
following.each { |followed| user.follow(followed) }
following.each { |follower| follower.follow(user) }