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
end
