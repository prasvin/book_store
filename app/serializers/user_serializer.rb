class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :total_orders, :total_amount, :top_5_available_books

  def total_orders
    object.total_orders_and_amount[:total_orders]
  end

  def total_amount
    object.total_orders_and_amount[:total_amount]
  end

  def top_5_available_books
    object.top_purchased_available_books(5)
  end
end
