class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates_inclusion_of :available, :in => [true, false]
  validates :price, presence: true
end
