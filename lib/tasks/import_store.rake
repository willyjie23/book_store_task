namespace :import_data do
  desc 'Craete import data to Store'
  task book_store: :environment do
    file = JSON.parse(File.read('book_storm/data/book_store_data.json'))
    file.each do |data|
      Store.create(
        books: data['books'],
        cash_balance: data['cashBalance'],
        name: data['storeName'],
        opening_hours: data['openingHours']
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
