require 'rails_helper'

describe "invoices relationships" do
  it "returns invoice transactions" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    transactions = create_list(:transaction, 3, invoice_id: invoice.id)
    invoice_id = invoice.id


    get "/api/v1/invoices/#{invoice_id}/transactions"

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(3)
  end
end
