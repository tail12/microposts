class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build if logged_in?
<<<<<<< HEAD
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
=======
      # @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
      @feed_items = current_user.feed_items.includes(:user).page(params[:page])
>>>>>>> master
    end
  end
end
