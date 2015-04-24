require 'faker'

# Create Posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

Post.find_or_create_by(title: "Hello There", body: "How are you doing?")
Comment.find_or_create_by(post_id: Post.first.id, body: "Pretty good.")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"