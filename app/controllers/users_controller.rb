class UsersController < ApplicationController
PER = 6

  def index
    @users = User.page(params[:page]).per(PER).order("name")
  end

  def search
    @users = User.page(params[:page]).per(PER).search(params[:q]).order("name")
    render :index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to [@user, :tasks], notice: "会員情報を登録しました"
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
