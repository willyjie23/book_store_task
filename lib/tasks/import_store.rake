namespace :import_data do
  desc 'Craete import data to Store'
  task book_store: :environment do
    file = JSON.parse(File.read('book_storm/data/book_store_data.json'))
    file.each do |data|
      ary = []
      data['openingHours'].split('/').each do |t|
        tt = t.split(' ')
        ary << { day: tt[0], open: (tt[1] + tt[2]), close: (tt[4] + tt[5]) }
      end

      Store.create(
        books: data['books'],
        cash_balance: data['cashBalance'],
        name: data['storeName'],
        opening_hours: ary
      )
    end

    p 'done!!!'
  end

  desc 'Create import data to User'
  task user: :environment do
    file = JSON.parse(File.read('book_storm/data/user_data.json'))
    file.each do |data|
      User.create(
        name: data['name'],
        cash_balance: data['cashBalance'],
        purchase_history: data['purchaseHistory']
      )
    end

    p 'done!!!'
  end
end
