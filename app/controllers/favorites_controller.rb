class FavoritesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post

    def create
        @post.fans << current_user
        redirect_to @post
    end

    def destroy
        favorite = current_user.favorites.find(params[:id])
        favorite.destroy
        redirect_to @post
    end

    private

    def set_post
        @post = Post.find(params[:post_id])
    end

end
