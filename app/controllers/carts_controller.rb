class CartsController < ApplicationController
  # GET /carts
  def index
    carts = Cart.inactive.includes(:user, items: :book)

    respond_with carts, each_serializer: Carts::IndexSerializer
  end
end
