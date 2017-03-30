class AccountsController < ApplicationController
  before_action :login_required

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(account_params)
      redirect_to :account, notice: "アカウント情報を更新しました"
    else
      render :new
    end

    def destroy
    end
  end

  private
  def account_params
    params.require(:account).permit(:name, :password, :password_confirmation)
  end
end
