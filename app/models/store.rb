class Store < ApplicationRecord
  serialize :books
  serialize :opening_hours
end
