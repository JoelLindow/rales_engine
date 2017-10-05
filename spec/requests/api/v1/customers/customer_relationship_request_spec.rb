require 'rails_helper'

describe "Customer Relationship enpoints" do
  it "returns a collection of associated invoices" do
    customer = create(:customer)
    merchant = create(:merchant)
    create_list(:invoice, 3, merchant_id: merchant.id, customer_id: customer.id)

    get "/api/v1/customers/#{customer.id}/invoices"

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(customer.invoices.count)

  end

  it "returns a collection of associated transactions" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:transaction, 3, invoice_id: invoice.id)

    get "/api/v1/customers/#{customer.id}/transactions"

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(customer.transactions.count)


  end
end
