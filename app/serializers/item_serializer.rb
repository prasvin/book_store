class ItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :book_id, :book_title

  def book_title
    object.book.title
  end
end
