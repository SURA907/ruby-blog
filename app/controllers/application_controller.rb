class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  def index
    @article_data = Article.all.order(:created_at => :desc)
  end
end
