Rails.application.config.generators do |g|
  #ヘルパーを生成しない
  g.helper false
  #CSS, JavaScript を変更しない
  g.assets false
  #config/routes.rb を変更しない
  g.skip_routes true
  #テストスクリプトを生成しない
  g.test_framework false
end