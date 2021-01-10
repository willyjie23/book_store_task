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

    post '/store_certain_time' do
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

    post '/store_open_day' do
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
      requires :day, type: String, desc: 'ex: Mon or Fri'
    end

    post '/store_open_day' do
      result = []
      Store.all.each do |s|
        s.opening_hours.each do |ss|
          result << ss.merge({ store_name: s.name }) if ss[:day] == params[:day]
        end
      end
      not_found_method(result)

      result
    end
  end
end
