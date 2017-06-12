class Email < ApplicationRecord
  belongs_to :contact

  validates :address, presence: true
end
