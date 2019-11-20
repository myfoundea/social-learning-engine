class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @favorite_posts = @user.favorite_posts
    end

    def index
        @users = User.all
    end

end
