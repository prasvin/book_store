class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :isbn, :price, :available, :total_orders
end
