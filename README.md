# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby 3.0.0p0
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

To Setup APP:

ruby -v 
  ruby 3.0.0
rails -v
  Rails 7.0.2.4

Configure database.yml 

  username
  password
  host

Run:
bundle install
rails db:create
rails db:migrate
rails db:seed  => Will create dummy testing data

BELOW ARE THE POSTMAN CURLS for reports API

a. Total number of likes and comments a user received for each of his/her post API:

POSTMAN CURL:

curl --location --request GET 'http://localhost:3000/users/20/posts' \
--header 'Content-Type: application/json'
{
    "posts": [
        {
            "post_id": 19,
            "user_id": 7,
            "comment_count": 1,
            "likes_coun": 0
        },
        {
            "post_id": 20,
            "user_id": 7,
            "comment_count": 3,
            "likes_coun": 0
        },
        {
            "post_id": 21,
            "user_id": 7,
            "comment_count": 0,
            "likes_coun": 0
        }
    ]
}


b. List of all users(having at least one post) and count of their posts

 curl --location --request GET 'http://localhost:3000/users' \
--header 'Content-Type: application/json'

{
    "users": [
        {
            "user_id": 1,
            "number_of_posts": 6
        },
        {
            "user_id": 2,
            "number_of_posts": 6
        }
        {
            "user_id": 8,
            "number_of_posts": 6
        },
        {
            "user_id": 17,
            "number_of_posts": 6
        },
        {
            "user_id": 18,
            "number_of_posts": 6
        },
        {
            "user_id": 19,
            "number_of_posts": 6
        },
        {
            "user_id": 20,
            "number_of_posts": 6
        }
    ]
}

1] Create USER API:
curl --location --request POST 'http://localhost:3000/users' \
--header 'Content-Type: application/json' \
--data-raw '{"users":
  {"name":"Roney Dev","email":"roneydev@gmail.com","password": "12345678"}
}'

2] GET USERS API:
curl --location --request GET 'http://localhost:3000/users' \
--header 'Content-Type: application/json'

3 ]UPDATE User API:

curl --location --request PATCH 'http://localhost:3000/users/40' \
--header 'Content-Type: application/json' \
--data-raw '{"users":
  {"name":"Roney Dev1","email":"eerty.rt@gmail.com","password": "123456789"}
}'

4] DELETE User
curl --location --request DELETE 'http://localhost:3000/users/40' \
--header 'Content-Type: application/json'



5] CREATE POST

curl --location --request POST 'http://localhost:3000/users/1/posts' \
--header 'Content-Type: application/json' \
--data-raw '{"posts":
  {"title":"test title","content":"content tests","user_id": 3}
}'

6] UPDATE POST
curl --location --request PATCH 'http://localhost:3000/users/1/posts/14' \
--header 'Content-Type: application/json' \
--data-raw '{"posts":
  {"title":"tests","content":"content tests","user_id": 3}
}'

7] DELETE POST:

curl --location --request DELETE 'http://localhost:3000/users/1/posts/124'


8]  CREATE COMMENT:

curl --location --request POST 'http://localhost:3000/users/20/posts/60/comments' \
--header 'Content-Type: application/json' \
--data-raw '{"comments":
  {"content":"test comment"}
}'

9] DELETE COMMENT

curl --location --request DELETE 'http://localhost:3000/users/20/posts/60/comments/6' \
--header 'Content-Type: application/json' \
--data-raw '{"comments":
  {"content":"test1ccees"}
}'

10] UPDATE COMMENT:
curl --location --request PATCH 'http://localhost:3000/users/20/posts/60/comments/6' \
--header 'Content-Type: application/json' \
--data-raw '{"comments":
  {"content":"test1cccees"}
}'

11] LIKE POST
curl --location --request GET 'http://localhost:3000/users/20/likes/60/like_post' \
--header 'Content-Type: application/json'

12] LIKE COMMENT

curl --location --request GET 'http://localhost:3000/users/20/likes/1/like_comment' \
--header 'Content-Type: application/json'


NOTE:
 => User dierctly can create posts, no user session creation developed.

