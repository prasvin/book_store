require 'rails_helper'
require 'support/requests/request_helper'
require 'support/shared_contexts/load_seeds'

include Requests::RequestHelper

RSpec.describe 'GET #index', type: :request do
  include_context 'load seeds'

  it 'should return error message for non-soil sample event type' do
    get_with_token '/users'
    expect(json_response.map { |users| users['id'] }).to eq(User.pluck(:id))

    expect(json_response[0]['total_purchased_books']).to eq(12)
    expect(json_response[0]['total_amount'].round(2)).to eq(1369.88)

    expect(json_response[0]['current_cart']['state']).to eq('active')
    expect(json_response[0]['current_cart']['items'].count).to eq(2)
  end
end
