class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def self.most_revenue(quantity)
    select("merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) AS total_revenue")
    .joins(:transactions, :invoice_items)
    .group(:id)
    .order("total_revenue DESC")
    .limit(quantity)
  end
end
