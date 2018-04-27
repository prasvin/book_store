class CartSerializer < ActiveModel::Serializer
  attributes :id, :state

  belongs_to :user
  has_many :items

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email
  end
end
