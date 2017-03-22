class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def user_task
    if params[:user_id]
      @user = User.find(params[:user_id])
    end
  end
  helper_method :user_task
end
