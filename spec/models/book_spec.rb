require 'rails_helper'

RSpec.describe Book, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:isbn) }

  it 'validate_uniqueness_of' do
    Book.create!(title: 'Ruby', author: 'Matz', isbn: '123-isbn-xx2', price: 119.99)
    should validate_uniqueness_of(:isbn)
  end

  it { is_expected.to validate_presence_of(:price) }
end
