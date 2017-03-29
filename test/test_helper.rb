ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  private
  #A session generally exists in the controller. http://stackoverflow.com/questions/20872121/undefined-method-session-for-nilnilclass-in-rspec-rails

  include ApplicationHelper
  #ログイン状態にする
  def login_as(name)
    session[:user_id] = FactoryGirl.create(:user, name: name)
  end

  def logout
    session.delete(:user_id)
  end
end
