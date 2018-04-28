class CartSerializer < ActiveModel::Serializer
  attributes :id, :state

  has_many :items
end
