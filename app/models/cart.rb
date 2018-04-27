class Cart < ApplicationRecord
  enum state: %i[active inactive ordered]

  has_many :items

  belongs_to :user

  validates :state, presence: true
end
