# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#User.create(email: "z@z", name: "zzz",  password: "password", password_confirmation: "password")
#User.create(email: "y@y", name: "yyy",  password: "password", password_confirmation: "password")
#
#10.times do |x|
#  Post.create(title: "Title #{x}", body: "Body #{x} Words go here", user_id: User.first.id)
#end
User.create(email: "z@z", name: "zzz",  password: "password", password_confirmation: "password", role: User.roles[:admin])
User.create(email: "y@y", name: "yyy",  password: "password", password_confirmation: "password")

elapsed = Benchmark.measure do
  posts = []
  zzz = User.first
  yyy = User.second
  1000.times do |x|
    puts "Creating post #{x}"
    #post = Post.new(title: "Title #{x}", body: "Body #{x} Words go here", user: User.first)
    post = Post.new(title: "Title #{x}", body: "Body #{x} Words go here", user: zzz)

    10.times do |y|
      puts "Creating comment #{y} for post #{x}"
      #post.comments.build(body: "Comment #{y}", user: User.second)
      post.comments.build(body: "Comment #{y}", user: yyy)

    end
    posts.push(post)
  end
  #Post.import(posts)
  Post.import(posts, recursive: true)
end

puts "Time elapsed: #{elapsed.real}"
