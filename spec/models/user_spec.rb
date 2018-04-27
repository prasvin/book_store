require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }

  it 'validate_uniqueness_of' do
    User.create!(email: 'john@doe.com', first_name: 'John', last_name: 'Doe')
    should validate_uniqueness_of(:email)
  end

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
end
