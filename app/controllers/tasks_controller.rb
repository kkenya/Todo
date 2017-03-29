class TasksController < ApplicationController
  before_action :login_required, except: [:index]

  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks.order(:released_at)
  end

  def new
    @task = current_user.tasks.build(released_at: Time.current)
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to [current_user, :tasks], notice: "タスクを作成しました"
    else
      render :new
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to [current_user, :tasks], notice: "タスクを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy!
    redirect_to [current_user, :tasks], notice: "タスクを削除しました"
  end


  private
  def task_params
    params.require(:task).permit(:title, :memo, :released_at, :expired_at)
  end
end
