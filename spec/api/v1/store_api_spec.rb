require 'rails_helper'

RSpec.describe V1::StoreAPI do
  context 'POST /api/v1/store_certain_time' do
    it 'should return 201 and store' do
      params = { open_time: '5:30am' }
      post '/api/v1/store_certain_time', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(result.first['name']).to eq('Pick-a-Book')
      expect(result.first['cash_balance']).to eq('416.69')
    end

    it 'should return 404 and not found' do
      params = { open_time: 'test' }
      post '/api/v1/store_certain_time', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(404)
      expect(result['error']).to eq('Record Not Found')
    end
  end

  context 'POST /api/v1/store_open_day' do
    it 'should return 201 and result' do
      params = { day: 'Fri' }
      post '/api/v1/store_open_day', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(result[2]['store_name']).to eq('A Whole New World Bookstore')
      expect(result[2]['close']).to eq('9pm')
    end

    it 'should return 404 and not found' do
      params = { day: 'rrrrr' }
      post '/api/v1/store_open_day', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(404)
      expect(result['error']).to eq('Record Not Found')
    end
  end
end
