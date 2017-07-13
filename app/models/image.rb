class Image < ApplicationRecord
  has_attached_file :image

  #validating content_type
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  # validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  #validating file_name
  # validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

  #don't validate
  #do_not_validate_attachment_file_type :image
end
