class Story < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :recipe_stories
  has_many :recipes, through: :recipe_stories
  has_many :comments
  has_many :readers, through: :comments
  validates :title, :content, presence: true
end
