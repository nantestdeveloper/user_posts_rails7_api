Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :posts do
      resources :comments
    end
    get 'likes/:post_id/like_post' => 'likes#like_post'
    get 'likes/:comment_id/like_comment' => 'likes#like_comment'
  end
  

end
