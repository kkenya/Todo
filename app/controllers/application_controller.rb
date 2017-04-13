class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class Forbidden < StandardError; end

  helper_method :current_user

  rescue_from Exception, with: :error500
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404

  private
  def current_user
    #遅延初期化
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    raise Forbidden unless current_user
  end

  def error404(e)
    render 'error404', status: 404, formats: [:html]
  end

  def error500(e)
    logger.error [e, *e.backtrace].join("¥n")
    render 'error500', status: 500, formats: [:html]
  end
end
