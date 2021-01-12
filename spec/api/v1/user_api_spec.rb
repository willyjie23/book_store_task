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
      expect(result.last['user']).to eq('Alma Meadows')
    end
  end

  context 'POST /api/v1/user_buy_books' do
    it 'should return 200 and user' do
      params = { user_id: 20, store_id: 1, book_name: 'Ruby: The Autobiography' }
      post '/api/v1/user_buy_books', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(result.first['purchase_history'].last.last['bookName']).to eq('Ruby: The Autobiography')
    end

    it 'should return 404 and not found' do
      params = { user_id: 1, store_id: 1, book_name: 'Ruby: The Autobiography' }
      post '/api/v1/user_buy_books', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(404)
      expect(result['message']).to eq('Record Not Found')
      expect(result['error_code']).to eq('record_not_found')
    end
  end
end
