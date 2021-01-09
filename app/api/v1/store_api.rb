module V1
  class StoreAPI < Base
    desc 'the api for store'
    get '/store_all' do
      Store.all
    end
  end
end
