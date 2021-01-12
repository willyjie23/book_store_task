require 'rails_helper'

RSpec.describe V1::UserAPI do
  context 'GET /api/v1/user_total_transaction' do
    it 'should return 200 and users' do
      params = { start_date: '20180401', end_date: '20180430' }
      get '/api/v1/user_total_transaction', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result.first['user']).to eq('Susan Maggio')
      expect(result.first['total']).to eq(65.92)
    end
  end

  context 'GET /api/v1/total_transaction' do
    it 'should return 200 and users' do
      params = { start_date: '20180401', end_date: '20180430' }
      get '/api/v1/total_transaction', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result['total_transaction']).to eq(55)
      expect(result['amount']).to eq(595.48)
    end
  end

  context 'GET /api/v1/user_total_transaction_date' do
    it 'should return 200 and users' do
      params = { start_date: '20180401', end_date: '20180430', total_price: 20 }
      get '/api/v1/user_total_transaction_date', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result[0]['user']).to eq('Beverly Corbin')
      expect( result.last['user']).to eq("Alma Meadows")
    end
  end
end
