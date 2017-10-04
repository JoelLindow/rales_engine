require 'rails_helper'

describe "invoices relationships" do
  it "returns invoice transactions" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice)
    create_list(:transactions, 3, invoice_id: invoice.id)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(3)
  end
end
