class Users::IndexSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :total_purchased_books, :total_amount, :current_cart

  def total_amount
    object.total_orders_and_amount[:total_amount]
  end

  def current_cart
    active_cart = object.carts.active.take
    return unless active_cart&.items&.exists?

    ActiveModelSerializers::SerializableResource.new(
      active_cart,
      serializer: CartSerializer
    )
  end
end
