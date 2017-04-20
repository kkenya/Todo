class SpeacksController < ApplicationController
  before_action :login_required

  def new
    raise ActionController::RoutingError, "不正なアクセス"
  end

  def create
    @task = Task.find(params[:task_id])
    speack = current_user.speacks.build do |s|
      s.task_id = params[:task_id]
      s.comment = params[:speack][:comment]
    end
    if speack.save
      redirect_to [@task.user, @task], notice: "コメントしました"
      # flash[:notice] = "コメントしました"
      # head 201
    else
      redirect_to root_path
      # render json: { messages: speack.errors.full_messages }, status: 422
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    @speack = current_user.speacks.find_by!(task_id: params[:task_id])
    @speack.destroy!
    redirect_to [@task.user, @task], notice: "コメントを削除しました"
  end
end