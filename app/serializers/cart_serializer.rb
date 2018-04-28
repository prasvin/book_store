class CartSerializer < ActiveModel::Serializer
  attributes :id, :state

  belongs_to :user
  has_many :items
end
