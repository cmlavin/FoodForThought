class FavoriteStory < ApplicationRecord
  belongs_to :user, :foreign_key => "reader_id"
  belongs_to :story

end
