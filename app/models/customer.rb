class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants
    .joins(:transactions)
    .merge(Transaction.successful)
    .group('merchants.id')
    .order('count(merchants.id) DESC')
    .first
  end
end
