module V1
  class UserAPI < Base
    helpers do
      def not_found_method(result)
        return error!('Record Not Found', 404) unless result.present?
      end
    end

    desc 'Serach users total transaction'
    params do
      requires :start_date, type: String, desc: 'ex: 19990101'
      requires :end_date, type: String, desc: 'ex: 19990131'
    end

    get '/user_total_transaction' do
      ary = []
      result = []
      start_date = params[:start_date].to_date
      end_date = params[:end_date].to_date

      User.all.each do |u|
        u.purchase_history.select { |data| ary << data if data['transactionDate'].between?(start_date, end_date) }
        result << { user: u.name, total: ary.map { |data| data['transactionAmount'] }.sum }
      end

      return result.sort_by { |user| -user[:total] }
    end

    desc 'Serach total transaction'
    params do
      requires :start_date, type: String, desc: 'ex: 19990101'
      requires :end_date, type: String, desc: 'ex: 19990131'
    end

    get '/total_transaction' do
      ary = []
      result = []
      start_date = params[:start_date].to_date
      end_date = params[:end_date].to_date

      User.all.each do |u|
        u.purchase_history.select { |data| ary << data if data['transactionDate'].between?(start_date, end_date) }
        result << { total_transaction: ary.size, total_price: ary.map { |data| data['transactionAmount'] }.sum }
      end
      not_found_method(result)
      total_transaction = result.inject(0) { |sum, hash| sum + hash[:total_transaction] }
      amount = result.inject(0) { |sum, hash| sum + hash[:total_price] }

      return { total_transaction: total_transaction, amount: amount }
    end
  end
end
