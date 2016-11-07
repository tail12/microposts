class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  # 404 Not Found 指定したページがない、アクセス権がない
  rescue_from ActionController::RoutingError, with: :error_404

  def error_404(e)
    @exception = e
    render 'errors/error_404', status: 404, formats: [:html]
  end

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
