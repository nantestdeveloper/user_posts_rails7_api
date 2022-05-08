class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]


    def index
      @users  = User.all.includes(:posts)
    end

    def new
      @user = User.new
    end

    def edit
    end

    def show
      render json: @user
    end


    def create
        user = User.create(user_params)
        result = {json: user.save ? user : user.errors}
        render result
    end
    
    def update
        result = {json: @user.update(user_params) ? @user : @user.errors}
        render result
    end

    def destroy
        if  @user.present?
          @user.destroy
          result = {json: "Destroyed post"}
        
        else 
          result = {json: "Post not found!"}
        end
        render result
    end
    private 
    
    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:users).permit(:name, :email, :password)
    end
end
