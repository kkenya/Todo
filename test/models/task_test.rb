require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  #空の値は無効
  test "presence" do
    task = Task.new
    assert task.invalid?
    assert task.errors.include?(:title)
    # assert task.errors.include?(:memo)
    assert task.errors.include?(:released_at)
    assert task.errors.include?(:expired_at)
  end

  #タイトルの長さは100以下
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

  #タスクの掲載有効期間は掲載日時より後
  test "expired_at" do
    task = FactoryGirl.build(:task)
    task.released_at = Time.current
    task.expired_at = 1.days.ago
    assert task.invalid?
    assert task.errors.include?(:expired_at)
  end

  #openスコープのチェック
  test "open" do
    task1 = FactoryGirl.create(:task, title: "今日", released_at: Time.current, expired_at: Time.current.end_of_day)
    task2 = FactoryGirl.create(:task, title: "昨日", released_at: 1.day.ago, expired_at: 1.day.ago.end_of_day)
    task3 = FactoryGirl.create(:task, title: "明日", released_at: 1.day.from_now, expired_at: 2.days.from_now)

    tasks = Task.today
    assert_includes tasks, task1, "今日のタスクが含まれる"
    refute_includes tasks, task2, "昨日の記事は含まれない"
    refute_includes tasks, task3, "明日の記事は含まれない"
  end
end