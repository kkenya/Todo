class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class Forbidden < StandardError; end

  helper_method :current_user

  private
  def current_user
    #遅延初期化
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    raise Forbidden unless current_user
  end
end
