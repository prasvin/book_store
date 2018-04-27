require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should belong_to :user }

  it { is_expected.to validate_presence_of(:state) }
end
