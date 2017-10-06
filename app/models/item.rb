class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope {order(:id)}

  def self.most_revenue(quantity_input = nil)
    unscoped.select("items.*, sum(invoice_items.unit_price * invoice_items.quantity) AS total_revenue")
    .joins(invoices: [:transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order("total_revenue DESC")
    .limit(quantity_input)
  end

  def self.most_items(quantity_input = nil)
    unscoped.joins(invoices: [:transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order("sum(quantity) DESC")
    .limit(quantity_input)
  end

end
