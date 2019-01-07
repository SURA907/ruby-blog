class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    @user_status = {:username => "sura"}
    @article_data = [
      {:article_id => 11,
       :article_title => '测试标题',
       :author => 'SURA',
       :upload_time => '2019-01-07',
       :article_body => '测试文章'},
      {:article_id => 12,
       :article_title => '测试标题2',
       :author => 'SURA',
       :upload_time => '2019-01-07',
       :article_body => '测试文章2'}
    ]
  end
end
