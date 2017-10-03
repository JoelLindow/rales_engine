class Item < ApplicationRecord
  belongs_to :merchant
  has many :invoice_items
  has many :invoices, through: :invoice_items
end
