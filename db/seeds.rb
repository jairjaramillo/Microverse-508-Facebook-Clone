# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |i|
  user = User.create(first_name: "name-#{i}", last_name: "Berg#{i}ng", email: "user#{i}@mail.com", password: "password")
  post = user.posts.build(content: "#{i} Post contentt-")
  post.save
end