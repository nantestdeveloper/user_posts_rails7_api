json.users @users do |user|
  json.user_id user.id
  json.number_of_posts user.posts.count
end  