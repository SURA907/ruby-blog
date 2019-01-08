class Article < ApplicationRecord
  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :content, :presence => true
  validates :author, :presence => true
  belongs_to :user
end
