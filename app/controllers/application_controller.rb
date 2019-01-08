class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  def index
    article_list = Article.all.order(:created_at => :desc)
    @article_data = article_list
  end
end
