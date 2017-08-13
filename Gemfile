source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
#パスワードのハッシュ化
gem 'bcrypt', '~> 3.1.7'
#日本語化
gem 'rails-i18n'
#scssでのbootstrapを使用する
gem 'bootstrap-sass'
#ページネーション
gem 'kaminari'
#kaminariをbootstrapに適応させる
gem 'kaminari-bootstrap'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
# Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  #er図の生成を行う
  gem 'rails-erd'
  # irbをより高機能に、ブレークポイントを作成
  gem 'pry-rails'
  # Pryでのステップ実行を行う
  gem 'pry-byebug'
  # factory_girlを使用する
  gem 'factory_girl_rails', '~> 4.4.0'
  # rspecによるテストを行う
  gem 'rspec-rails'
  # railsの規約に沿わない記法を検出する
  gem 'rubocop', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # N+1問題の検出する
  gem 'bullet'
end

group :test do
  #controllerでのtestを行う
  gem 'rails-controller-testing'
end

group :production do
  # PostgreSQLデータベースを使用する
  gem 'pg'
  # Herokuで静的なアセットを提供する
  gem 'rails_12factor'
end