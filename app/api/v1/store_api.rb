module V1
  class StoreAPI < Base
    helpers do
      def not_found_method(result)
        return error!('Record Not Found', 404) unless result.present?
      end
    end

    desc 'Store certain datetime'
    params do
      requires :open_time, type: String, desc: 'ex: 3pm or 5:30am'
    end

    get '/store_certain_time' do
      result = []
      Store.all.each do |s|
        s.opening_hours.each do |ss|
          result << s if ss[:open] == params[:open_time]
        end
      end
      not_found_method(result)

      result
    end

    desc 'Store open weekday and time'
    params do
      requires :day, type: String, desc: 'ex: Mon or Fri'
    end

    get '/store_open_day' do
      result = []
      Store.all.each do |s|
        s.opening_hours.each do |ss|
          result << ss.merge({ store_name: s.name }) if ss[:day] == params[:day]
        end
      end
      not_found_method(result)

      result
    end

    desc 'Store opening hours'
    params do
      requires :open_hours, type: String
    end

    get '/store_open_hours' do
      result = []
      Store.all.each do |s|
        h = s.opening_hours.map { |ss| Time.parse(ss[:close]).strftime('%k').to_i - Time.parse(ss[:open]).strftime('%k').to_i }
        result << s.name if h.sum >= params[:open_hours].to_i
      end
      not_found_method(result)

      result
    end

    desc 'Store book total'
    params do
      requires :total, type: Integer
    end

    get '/store_book_total' do
      result = []
      Store.all.each do |s|
        result << s if s.books.size >= params[:total]
      end
      not_found_method(result)

      result
    end

    desc 'Search store name'
    params do
      requires :name, type: String
    end

    get '/store_name' do
      result = []
      Store.all.each do |s|
        result << s if s.name.include?(params[:name])
      end
      not_found_method(result)

      result
    end
  end
end
