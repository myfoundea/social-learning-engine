class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @feed_items = current_user.feed
    else
      @feed_items = Post.limit(10).order('id desc')
    end
    @users_home = User.limit(10).order('id desc')
  end

  def imprint
  end

  def privacy
  end

  def about
  end

  def contact
  end

end
