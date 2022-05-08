
#create test user and posts

20.times do |i|
    user = User.find_or_create_by!(
        name:"User #{i}", 
        email: "user#{i}@gmail.com",
        password:"user#{i}"
    )
    puts "User #{user.name}"
    3.times do |j|
        post = Post.create!(
            title: "Title #{j}",
            content: "Content #{j} Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            user_id: user.id
        )
        puts "User #{user.name} post #{post.title}"
    end
end

#create test comments and likes
Post.all.limit(10).each do |post|
    user1 = User.find 1
    user2 = User.find 2
    user3 = User.find 3
    puts "Comment   #{post.id}"
    comment  = post.comments.create!(content: "Text comment #{post.id}",post_id: post.id,user_id: user1.id )
    comment1  = post.comments.create!(content: "Text comment new #{post.id}",post_id: post.id,user_id: user2.id )
    comment2  = post.comments.create!(content: "Text comment new #{post.id}",post_id: post.id,user_id: user3.id )
    post.likes << Like.new(user_id: user1.id)
    post.likes << Like.new(user_id: user2.id)
    post.likes << Like.new(user_id: user3.id)
    comment.likes << Like.new(user_id: user1.id)
    comment1.likes << Like.new(user_id: user2.id)
    comment2.likes << Like.new(user_id: user3.id)

end
Post.all.limit(15).each do |post|
    user = User.first
    puts "Comment   #{post.id}"
    comment = post.comments.create!(content: "Text comment #{post.id}",post_id: post.id,user_id: user.id )
    post.likes << Like.new(user_id: user.id)
    comment.likes << Like.new(user_id: user.id)

end