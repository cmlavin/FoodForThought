class User < ApplicationRecord
  has_many :comments, :foreign_key => "reader_id"
  has_many :stories, :foreign_key => "author_id"
  has_many :recipe_stories, through: :stories
  has_many :recipes, :foreign_key => "author_id"
  has_many :favorite_recipes, :foreign_key => "reader_id"
  has_many :fav_recipes, through: :favorite_recipes, source: :recipe
  has_many :favorite_stories, :foreign_key => "reader_id"
  has_many :fav_stories, through: :favorite_stories, source: :story
  validates :first_name, :last_name, :user_name, :password, :password_confirmation, presence: true
  validates :user_name, uniqueness: true
  validates :password, :confirmation => true

  has_secure_password

  def to_s
    self.first_name + " " + self.last_name
  end

end
