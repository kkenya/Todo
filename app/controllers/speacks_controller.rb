class SpeacksController < ApplicationController
  before_action :login_required

  def new
    raise ActionController::RoutingError, "不正なアクセス"
  end

  def create
    task = Task.find(params[:task_id])
    speack = current_user.speacks.build do |t|
      t.task_id = params[:task_id]
      t.comment = params[:speack][:comment]
    end
    if speack.save
      flash[:notice] = "コメントしました"
      head 201
    else
      # render json: { messages: speack.errors.full_messages }, status: 422
    end
  end

  def destroy
    @task = Task.find(params[:id])
    speack = current_user.speacks.find_by!(task_id: params[:task_id])
    speack.destroy!
    redirect_to [current_user, @task], notice: "コメントを削除しました"
  end
end