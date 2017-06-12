class Image < ApplicationRecord
  belongs_to :contact

  validates :file, presence: true
  validates :contact_id, uniqueness: true
end
