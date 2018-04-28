class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart

  validates :amount, presence: true

  # callbacks
  before_validation :set_amount
  after_commit :mark_cart_as_ordered, :update_order_id_on_items

  private

  def set_amount
    return unless user || cart

    amount = 0
    cart.items.each { |item| amount += item.quantity * item.book.price }
    self.amount = amount
  end

  def mark_cart_as_ordered
    cart.ordered!
  end

  def update_order_id_on_items
    cart.items.each { |item| item.update!(order: self) }
  end
end
