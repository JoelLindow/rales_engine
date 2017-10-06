require 'rails_helper'

describe "item relationships" do
  it "returns item invoice_items" do
    merchant = create(:merchant)
    customer = create(:customer)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    create_list(:invoice_item, 3, item_id: item.id, invoice_id: invoice.id)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(3)
  end

  it "returns item merchant" do
    merchant =  create(:merchant)
    item =      create(:item, merchant_id: merchant.id)
    customer =  create(:customer)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_success

    merchant_jason = JSON.parse(response.body)

    expect(merchant_jason["name"]).to eq(merchant.name)
  end
end
