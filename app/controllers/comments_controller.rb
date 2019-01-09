class CommentsController < ApplicationController
  # 增加评论
  def create
    param = user_comment_params
    param[:user_id] = current_user[:id]
    param[:author] = current_user[:username]
    @comment = Comment.new(param)
    if @comment.save
      redirect_to "/articles/#{param[:article_id]}}"
    else
      render html: "<h1>500, server error</h1>"
    end
  end

  private
    def user_comment_params
      params.require(:comment).permit(:content, :article_id)
    end
end
