module V1
  class BookAPI < Base
    helpers do
      def not_found_method(result)
        return error!('Record Not Found', 404) unless result.present?
      end
    end

    desc 'Serach books price'
    params do
      requires :price, type: Float
    end

    get '/book_price' do
      result = []
      Store.all.each do |s|
        s.books.each do |p|
          result << p if p['price'] <= params[:price]
        end
      end
      not_found_method(result)

      result.sort_by { |b| b['price'] }
    end
  end
end
