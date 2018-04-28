class Cart < ApplicationRecord
  VALID_STATES = %i[active inactive ordered]
  enum state: VALID_STATES

  belongs_to :user
  has_many :items

  validates :state, presence: true

  VALID_STATES.each do |state|
    scope state, lambda { where(state: state) }
  end
end
