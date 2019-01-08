class User < ApplicationRecord
  validates :username, length: {minimum: 4},
end
