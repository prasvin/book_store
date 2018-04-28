class Carts::IndexSerializer < ActiveModel::Serializer
  attributes :id, :state

  belongs_to :user
end
