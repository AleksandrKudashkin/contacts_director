class Address < ApplicationRecord
  belongs_to :contact

  validates :street_1, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :postal_code, presence: true
end
