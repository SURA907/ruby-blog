class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper

  def index
    @user_status = {}
    @article_data = [
      {:id => 11,
       :title => '测试标题',
       :author_id => 1,
       :author => 'SURA',
       :created_at => '2019-01-07',
       :content => '测试文章'},
      {:id => 12,
       :title => '测试标题2',
       :author_id => 1,
       :author => 'SURA',
       :created_at => '2019-01-07',
       :content => '测试文章2'},
    ]
  end
end
