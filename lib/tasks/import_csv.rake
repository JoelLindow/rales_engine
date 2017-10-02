require 'csv'

namespace :import_csv do
  task customers: :environment do
    csv_text = File.read('./data/customers.csv')
    csv = CSV.parse(csv_text, :headers => true, header_converters: :symbol)
    csv.each do |row|
      Customer.create!(row.to_hash)
    end
  end

  task all: [:customers]
end