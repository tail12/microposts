class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build if logged_in?
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page(params[:page])
      # @feeds_scope = current_user.feed_items.includes(:user).order(created_at: :desc).page(params[:page])
      # @feed_items = @feeds_scope.extend(Kaminari::PaginatableRelationToPaginatableArray).to_paginatable_array
    end
  end
end
