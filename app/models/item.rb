class Item < ApplicationRecord
  belongs_to :book
  belongs_to :cart
  belongs_to :order, optional: true

  validates :quantity, presence: true
end
