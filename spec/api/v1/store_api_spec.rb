require 'rails_helper'

RSpec.describe V1::StoreAPI do
  context 'GET /api/v1/store_certain_time' do
    it 'should return 200 and store' do
      params = { open_time: '5:30am' }
      get '/api/v1/store_certain_time', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result.first['name']).to eq('Pick-a-Book')
      expect(result.first['cash_balance']).to eq('416.69')
    end

    it 'should return 404 and not found' do
      params = { open_time: 'test' }
      get '/api/v1/store_certain_time', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(404)
      expect(result['error']).to eq('Record Not Found')
    end
  end

  context 'GET /api/v1/store_open_day' do
    it 'should return 200 and result' do
      params = { day: 'Fri' }
      get '/api/v1/store_open_day', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result[2]['store_name']).to eq('A Whole New World Bookstore')
      expect(result[2]['close']).to eq('9pm')
    end

    it 'should return 404 and not found' do
      params = { day: 'rrrrr' }
      get '/api/v1/store_open_day', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(404)
      expect(result['error']).to eq('Record Not Found')
    end
  end

  context 'GET /api/v1/store_open_hours' do
    it 'should return 200 and result' do
      params = { open_hours: '50' }
      get '/api/v1/store_open_hours', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result[0]).to eq('Author Attic')
    end

    it 'should return 404 and not found' do
      params = { open_hours: '500' }
      get '/api/v1/store_open_hours', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(404)
      expect(result['error']).to eq('Record Not Found')
    end
  end

  context 'GET /api/v1/store_book_total' do
    it 'should return 200 and result' do
      params = { total: 14 }
      get '/api/v1/store_book_total', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result.first['name']).to eq('Look Inna Book')
      expect(result.first['books'].size).to eq(14)
    end

    it 'should return 404 and not found' do
      params = { total: 15 }
      get '/api/v1/store_book_total', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(404)
      expect(result['error']).to eq('Record Not Found')
    end
  end

  context 'GET /api/v1/store_name' do
    it 'should return 200 and result' do
      params = { name: 'v' }
      get '/api/v1/store_name', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result.first['name']).to eq('Undercover Books')
    end

    it 'should return 404 and not found' do
      params = { total: 15 }
      get '/api/v1/store_book_total', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(404)
      expect(result['error']).to eq('Record Not Found')
    end
  end

  context 'POST /api/v1/update_store' do
    it 'should return 200 and result' do
      params = { id: 1, name: 'test' }
      post '/api/v1/update_store', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(result.first['message']).to eq('ok!')
    end

    it 'should return 404 and not found' do
      params = { id: 25, name: 'test' }
      post '/api/v1/update_store', params: params
      result = JSON.parse(response.body)

      expect(response.status).to eq(404)
      expect(result['message']).to eq('Record Not Found')
    end
  end

  context 'GET /api/v1/best_store' do
    it 'should return 200 and result' do
      get '/api/v1/best_store'
      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result[0]).to eq('Turn the Page')
      expect(result[4]).to eq('Uptown Books')
    end
  end
end
