class Admin::UsersController < Admin::Base
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
      redirect_to [:admin, @user, :tasks], notice: "会員情報を登録しました"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to [:admin, @user, :tasks], notice: "会員情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to [:admin, :users], notice: "会員情報を削除しました"
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :administrator)
  end
end
