require 'rails_helper'

describe "Invoice Items Relationships" do
  it "returns the associated invoice" do
    customer = create(:customer)
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    invoice_json = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item.invoice).to eq(invoice)
  end

  it "returns the associated item" do
    customer = create(:customer)
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    item_json = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item.item).to eq(item)


  end
end
