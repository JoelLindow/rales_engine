require 'rails_helper'

describe "merchant relationships" do
  it "returns merchant items" do
      merchant = create(:merchant)
      create_list(:item, 3, merchant_id: merchant.id)

      get "/api/v1/merchants/#{merchant.id}/items"

      expect(response).to be_success

      items = JSON.parse(response.body)

      expect(items.count).to eq(3)
  end

  it "returns merchant invoices" do
    merchant = create(:merchant)
    customer = create(:customer)

    create_list(:invoice, 3, merchant_id: merchant.id, customer_id: customer.id)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end
end
