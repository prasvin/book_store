class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart

  validates :amount, presence: true

  before_validation :set_amount

  private

  def set_amount
    return unless user || cart

    amount = 0
    cart.items.each do |item|
      amount += item.quantity * item.book.price
    end

    self.amount = amount
  end
end
