class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :image, dependent: :destroy

  accepts_nested_attributes_for :image, allow_destroy: true

  validates :first_name, presence: true
end
