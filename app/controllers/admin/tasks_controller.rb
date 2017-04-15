class Admin::TasksController < Admin::Base

  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks.order(:created_at)
  end

  def new
    @user = User.find(params[:user_id])
    @task = @user.tasks.build
  end

  def edit
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.build(task_params)
    if @task.save
      redirect_to [:admin, @user, :tasks], notice: "タスクを作成しました"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to [:admin, @user, :tasks], notice: "タスクを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    @task.destroy!
    redirect_to [:admin, @user, :tasks], notice: "タスクを削除しました"
  end


  private
  def task_params
    params.require(:task).permit(:title, :memo, :status, :open)
  end
end
