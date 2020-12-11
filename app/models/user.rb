class User < ApplicationRecord
  before_save { self.username = username.downcase }

  validates :username, presence: true, uniqueness:  { case_sensitive: false}, length: { minimum: 3, maximum: 10 }

  has_many :articles, foreign_key: :author_id, class_name: 'Article'
  has_many :votes
end
