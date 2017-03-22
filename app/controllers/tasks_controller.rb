class TasksController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @tasks = @user.tasks
    else
      @tasks = Task.order(released_at: :desc)
    end
  end

  def new
    @task = Task.new(released_at: Time.current)
  end

  def edit
    @task = user_task.tasks.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.user = @user
    if @task.save
      redirect_to action: "index", notice: "タスクを作成しました"
    else
      render "new"
    end
  end

  def update
    @task = user_task.tasks.find(params[:id])
    @task.assign_attributes(task_params)
    if @task.save
      redirect_to action: "index", notice: "タスクを更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @task = user_task.tasks.find(params[:id])
    @task.destroy
    redirect_to :tasks, notice: "タスクを削除しました"
  end


  private
  def task_params
    params.require(:task).permit(:title, :memo, :released_at, :expired_at)
  end
end
