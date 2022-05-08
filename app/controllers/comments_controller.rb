class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :edit, :update, :destroy]
    def index
      @comments = Comment.all
      render json: @comments
    end
    
       
    def show
    end
    
    def new
      @comment = Comment.new
    end
    
    def edit
    end
    
    def create
        @post  = Post.find_by(id: params[:post_id])
        @user  = Post.find_by(id: params[:user_id])
        if @post.present? && @user.present?
          @comment = @post.comments.create(comment_params.merge(user_id: params[:user_id]))
          result = {json: @comment}
        else
          result = {json: "Post not found!"} if  @post.nil?
          result = {json: "User not found!"} if  @user.nil?
        end
        render result
    end
 
    def update
      if @comment.present?
        @comment.update(comment_params.merge(user_id: params[:user_id],post_id: params[:post_id]))
        result = {json: @comment}
      else
        result = {json: "Comment not found!"}
      end
      render result
    end
    
      
    def destroy
        if @comment.present?
          @comment.destroy
          result = {json: "Destroyed post"}
          
        else 
          result = {json: "Comment not found!"}
        end
        render result
    end
    
    private
    def set_comment
        @comment = Comment.find_by(id: params[:id])
    end

    def comment_params
      params.require(:comments).permit(:content, :user_id,:post_id)
    end
end
