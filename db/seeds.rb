# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do | n |
  email = "example-#{n+1}@gmail.com"
  user = User.create(
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: email,
          password: "password",
          password_confirmation: "password",
          created_at: Time.zone.now
  )
  puts user.inspect
end

users = User.order(:created_at).take(100)
50.times do
  users.each do |user|
    content = Faker::Lorem.sentence(10)
    likes = (1..50).to_a.sample
    user.posts.create!(content: content, likes: likes)
    puts user.posts.inspect
  end
end

users = User.all
following = users[1..50]
followers = users[51..100]
following.each { | followed | followers.each { | follower | follower.follow(followed)}}
followers.each { | follower | following.each { | followed | followed.follow(follower)}}