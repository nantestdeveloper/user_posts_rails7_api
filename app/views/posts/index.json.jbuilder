json.posts @posts do |post|
  json.post_id post.id
  json.user_id post.user_id
  json.comment_count post.comments.count
  json.likes_count post.likes.count
end  