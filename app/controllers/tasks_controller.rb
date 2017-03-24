class TasksController < ApplicationController
  before_action :login_required, expect: [:index]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @tasks = @user.tasks
    else
      @tasks = Task.order(released_at: :desc)
    end
  end

  def new
    @user = current_user
    @task = Task.new(released_at: Time.current)
  end

  def edit
    @user = current_user
    @task = current_user.tasks.find(params[:id])
  end

  def create
    @user = current_user
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to [@task.user, :tasks], notice: "タスクを作成しました"
    else
      render "new"
    end
  end

  def update
    @user = current_user
    @task = current_user.tasks.find(params[:id])
    @task.assign_attributes(task_params)
    if @task.save
      redirect_to [@user, :tasks], notice: "タスクを更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @user = current_user
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to [@user, :tasks], notice: "タスクを削除しました"
  end


  private
  def task_params
    params.require(:task).permit(:title, :memo, :released_at, :expired_at)
  end
end
