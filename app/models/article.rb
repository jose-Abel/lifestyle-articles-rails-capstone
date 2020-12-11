class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :text, presence: true, length: { minimum: 10, maximum: 10000 }
  
  belongs_to :user, foreign_key: :author_id, class_name: 'User'
  has_many :votes
  has_many :article_categories
  has_many :categories, through: :article_categories
end