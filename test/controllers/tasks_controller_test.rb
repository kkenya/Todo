require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  test "index" do
    5.times { FactoryGirl.create(:task) }
    get :index
    assert_response :success
    assert_equal 5, assigns(:tasks).count
  end

  test "new" do
    get :new
    assert_response :success
  end

  test "edit" do
    task = FactoryGirl.create(:task)
    get :edit, params: { id: task }
    assert_response :success
  end

  test "create" do
    attrs = FactoryGirl.attributes_for(:task)
    post :create, params: { task: attrs }
    task = Task.order(:id).last
    assert_redirected_to :tasks
  end

  test "update" do
    task = FactoryGirl.create(:task)
    patch :update, params: { id: task , task: FactoryGirl.attributes_for(:task) }
    # assert_redirected_to :tasks
    assert_template "index"
  end

  test "fail to create" do
    attrs = FactoryGirl.attributes_for(:task, title: "")
    post :create, params: { task: attrs }
    assert_response :success
    assert_template "new"
  end

  test "fail to update" do
    attrs = FactoryGirl.attributes_for(:task, expired_at: "")
    task = FactoryGirl.create(:task)
    put :update, params: { id: task, task: attrs }
    assert_response :success
    assert_template "edit"
  end

  test "destroy" do
    task = FactoryGirl.create(:task)
    delete :destroy, params: { id: task }
    assert_redirected_to :tasks
    assert_raises(ActiveRecord::RecordNotFound) { Task.find(task.id) }
  end
end
