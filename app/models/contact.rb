class Contact < ApplicationRecord
  has_many :emails, dependent: :destroy
  has_many :phones, dependent: :destroy
  has_many :urls, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_one :image, dependent: :destroy

  validates :first_name, presence: true
end
