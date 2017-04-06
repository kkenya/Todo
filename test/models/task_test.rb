require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  #空の値は無効
  test "presence" do
    task = Task.new
    assert task.invalid?
    assert task.errors.include?(:title)
  end

  #タイトルの長さは50以下
  test "tlength" do
    task = FactoryGirl.build(:task)
    task.title = "a" * 101
    assert task.invalid?
    assert task.errors.include?(:title)
  end

  #メモの長さは200以下
  test "mlength" do
    task = FactoryGirl.build(:task)
    task.memo = "a" * 201
    assert task.invalid?
    assert task.errors.include?(:memo)
  end

  #期限は３通り
  test "status" do
    task = FactoryGirl.build(:task)
    task.status = "aaa"
    assert task.invalid?
    assert task.errors.include?(:status)
  end

  #dailyスコープのチェック
  test "daily" do
    task1 = FactoryGirl.create(:task, title: "今日", status: "today", created_at: Time.now)
    task2 = FactoryGirl.create(:task, title: "昨日", status: "today", created_at: 1.day.ago)
    task3 = FactoryGirl.create(:task, title: "明日", status: "today", created_at: 1.day.since)

    tasks = Task.daily
    assert_includes tasks, task1, "今日のタスクが含まれる"
    refute_includes tasks, task2, "昨日のタスクは含まれない"
    refute_includes tasks, task3, "明日のタスクは含まれない"
  end

  #monthlyスコープのチェック
  test "monthly" do
    task1 = FactoryGirl.create(:task, title: "今週", status: "month", created_at: Time.now)
    task2 = FactoryGirl.create(:task, title: "先週", status: "month", created_at: 1.month.ago)
    task3 = FactoryGirl.create(:task, title: "来週", status: "month", created_at: 1.month.since)

    tasks = Task.monthly
    assert_includes tasks, task1, "今月のタスクが含まれる"
    refute_includes tasks, task2, "先月のタスクは含まれない"
    refute_includes tasks, task3, "来月のタスクは含まれない"
  end
end