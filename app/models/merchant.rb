class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  # default_scope {order(:id)}

  def self.most_revenue(quantity)
    select("merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) AS total_revenue")
    .joins(:transactions, :invoice_items)
    .group(:id)
    .order("total_revenue DESC")
    .limit(quantity)
  end

  def self.most_items(quantity_input)
    joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .group(:id)
    .order("sum(quantity) DESC")
    .limit(quantity_input)
  end

  def total_revenue
    invoices.joins(:transactions).where("result = 'success'").joins(:invoice_items).sum("invoice_items.quantity * invoice_items.unit_price")
  end



end
