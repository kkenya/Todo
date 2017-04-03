class AccountsController < ApplicationController
  before_action :login_required

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(account_params)
      redirect_to [@user, :tasks], notice: "アカウント情報を更新しました"
    else
      render :edit
    end
  end

  def retire
  end

  def destroy
    current_user.destroy!
    reset_session
    redirect_to :root, notice: "退会しました"
  end

  private
  def account_params
    params.require(:account).permit(:name, :password, :password_confirmation)
  end
end
