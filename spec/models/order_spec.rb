require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :user }
  it { should belong_to :cart }

  it { is_expected.to validate_presence_of(:amount) }

end
