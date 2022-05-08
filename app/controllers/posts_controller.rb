class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


    def index
      user = User.find_by(id: params[:user_id])
      if user.present?
        @posts = user.posts.includes(:comments)
      end
    end

    # GET /posts/1
    # GET /posts/1.json
    def show
    end

    # GET /posts/new
    def new
    @post = Post.new
    end

    # GET /posts/1/edit
    def edit
    end

    def create
        @post = Post.new(post_params)
        result = {json: @post.save ? @post : @post.errors}
        render result
    end

    # PATCH/PUT /posts/1
    # PATCH/PUT /posts/1.json
    def update
        result = {json:  @post.update(post_params) ? @post : @post.errors}
        render result
    end

    # DELETE /posts/1
    # DELETE /posts/1.json
    def destroy
        if  @post.present?
          @post.destroy
         result = {json: "Destroyed post"}
         
        else 
          result = {json: "Post not found!"}
        end
        render result
    end

    private
    def set_post
        @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.require(:posts).permit(:title, :content, :user_id)
    end
end