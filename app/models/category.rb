class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }

  validates :priority, presence: true

  has_many :article_categories
  has_many :articles, through: :article_categories
end
