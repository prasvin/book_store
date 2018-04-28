class User < ApplicationRecord
  has_many :carts
  has_many :orders

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def total_orders_and_amount
    { total_orders: orders.count, total_amount: orders.pluck(:amount).sum }
  end

  def total_purchased_books
    Item.where(order: orders).sum(:quantity)
  end

  def top_purchased_available_books(limit = 5)
    top_purchased_books = Item.joins(:book)
      .where(books: { available: true }, order: orders)
      .limit(limit)
      .group(:book_id).order('sum_quantity DESC').sum(:quantity)

    Book.where(id: top_purchased_books.keys)
  end
end
