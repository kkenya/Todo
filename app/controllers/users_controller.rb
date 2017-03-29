class UsersController < ApplicationController
  def index
    @users = User.order("name")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to [@user, :tasks], notice: "会員情報を登録しました"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to controller: "tasks", action: "index", notice: "会員情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to :users, notice: "会員情報を削除しました"
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
