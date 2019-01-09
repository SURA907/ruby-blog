class AddIndexToCommentsArticleId < ActiveRecord::Migration[5.1]
  def change
    add_index :comments, :article_id
  end
end
