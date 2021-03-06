require 'rails_helper'

describe "Item Business Intelligence" do
  it " returns the top x items ranked by total revenue" do
    customer = create(:customer)
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)
    item1 = create(:item, merchant_id: merchant1.id, unit_price: 100)
    item2 = create(:item, merchant_id: merchant2.id, unit_price: 100)
    item3 = create(:item, merchant_id: merchant3.id, unit_price: 100)

    invoice1 = create(:invoice, customer_id: customer.id, merchant_id: merchant1.id)
    invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 2, item_id: item1.id)
    transaction1 = create(:transaction, invoice_id: invoice1.id, result: "success")

    invoice2 = create(:invoice, customer_id: customer.id, merchant_id: merchant2.id)
    invoice_item2 = create(:invoice_item, invoice_id: invoice2.id, quantity: 1, item_id: item2.id)
    transaction2 = create(:transaction, invoice_id: invoice2.id, result: "success")

    invoice3 = create(:invoice, customer_id: customer.id, merchant_id: merchant3.id)
    invoice_item3 = create(:invoice_item, invoice_id: invoice3.id, quantity: 3, item_id: item3.id)
    transaction3 = create(:transaction, invoice_id: invoice3.id, result: "success")

    get "/api/v1/merchants/most_revenue?quantity=2"

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(2)
    expect(merchants.first["id"]).to eq(merchant3.id)
    expect(merchants.last["id"]).to eq(merchant1.id)

  end

  it " returns the top x items ranked by total number sold" do
    customer = create(:customer)
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)
    item1 = create(:item, merchant_id: merchant1.id, unit_price: 100)
    item2 = create(:item, merchant_id: merchant2.id, unit_price: 100)
    item3 = create(:item, merchant_id: merchant3.id, unit_price: 100)

    invoice1 = create(:invoice, customer_id: customer.id, merchant_id: merchant1.id)
    invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 2, item_id: item1.id)
    transaction1 = create(:transaction, invoice_id: invoice1.id, result: "success")

    invoice2 = create(:invoice, customer_id: customer.id, merchant_id: merchant2.id)
    invoice_item2 = create(:invoice_item, invoice_id: invoice2.id, quantity: 1, item_id: item2.id)
    transaction2 = create(:transaction, invoice_id: invoice2.id, result: "success")

    invoice3 = create(:invoice, customer_id: customer.id, merchant_id: merchant3.id)
    invoice_item3 = create(:invoice_item, invoice_id: invoice3.id, quantity: 3, item_id: item3.id)
    transaction3 = create(:transaction, invoice_id: invoice3.id, result: "success")

    get "/api/v1/items/most_items?quantity=2"

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(2)
  end

end
