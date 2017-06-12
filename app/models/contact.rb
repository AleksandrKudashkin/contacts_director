class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  mount_uploader :file, FileUploader

  validates :first_name, presence: true
end
