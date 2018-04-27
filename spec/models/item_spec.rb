require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to :book }
  it { should belong_to :cart }
  it { should belong_to :order }

  it { is_expected.to validate_presence_of(:quantity) }
end
