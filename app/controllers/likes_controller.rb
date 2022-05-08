class LikesController < ApplicationController


    def like_post
      @post = Post.find_by(id: params[:post_id])
      if @post.present?
        @post.likes << Like.new(user_id: params[:user_id])
      else
      end
      render result
    end
    
    def like_comment
        @comment = Comment.find_by(id: params[:comment_id])
        if @comment.present?
          @comment.likes << Like.new(user_id: params[:user_id])
        else
        end
        render result
    end
    

   
end
