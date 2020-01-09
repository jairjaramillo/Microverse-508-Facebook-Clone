# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |i|
  user = User.create(first_name: "name-#{i}", last_name: "Berg#{i}ng", email: "user#{i}@mail.com", password: '123abc')
  post = user.posts.build(content: "#{i} Post contentt: Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
  post.save
end

20.times do |i|
  5.times do |j|
    rando = (rand * 10).to_i
    comment = Post.find(i + 1).comments.build(commenter_id: rando,
                                          content: "Rando comment ##{j}: Lorem ipsum dolor sit amet,
                                          consectetur adipiscing elit.")
    comment.save
  end
end
