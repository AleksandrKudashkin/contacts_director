class Image < ApplicationRecord
  belongs_to :contact

  validates :file, presence: true
  validates :contact_id, uniqueness: true

  mount_uploader :file, FileUploader
end
