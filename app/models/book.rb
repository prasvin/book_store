class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates_inclusion_of :available, :in => [true, false]
  validates :price, presence: true

  def total_orders
    Item.where.not(order_id: nil, book: self).sum(:quantity)
  end

  class << self
    def total_sold
      Item.where.not(order_id: nil).sum(:quantity)
    end

    def best_sellers(limit = 5)
      top_purchased_books = Item.where.not(order_id: nil).limit(limit).group(:book_id).order('sum_quantity DESC').sum(:quantity)

      Book.where(id: top_purchased_books.keys)
    end
  end
end
