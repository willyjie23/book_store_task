require 'rails_helper'

RSpec.describe V1::StoreAPI do
  context 'GET /api/v1/store_all' do
    it 'should return 200 and store' do
      get '/api/v1/store_all'
      VCR.use_cassette('test') do
        result = JSON.parse(response.body)
        expect(response.status).to eq(200)
      end
    end
  end
end
