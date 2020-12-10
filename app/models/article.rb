class Article < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, class_name: 'User'
  has_many :votes
  has_many :article_categories
  has_many :categories, through: :article_categories
end