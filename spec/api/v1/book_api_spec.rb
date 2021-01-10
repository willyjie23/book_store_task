require 'rails_helper'

RSpec.describe V1::BookAPI do
  context 'GET /api/v1/book_price' do
    it 'should return 200 and books' do
      params = { price: 9 }
      get '/api/v1/book_price', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result[0]['bookName']).to eq('Learning Elixir')
      expect(result[1]['price']).to eq(8)
    end

    it 'should return 404 and not found' do
      params = { price: 0.13 }
      get '/api/v1/book_price', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(404)
      expect(result['error']).to eq('Record Not Found')
    end
  end
end
