class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :isbn, :price
end
