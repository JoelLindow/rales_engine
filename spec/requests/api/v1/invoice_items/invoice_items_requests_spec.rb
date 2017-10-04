require 'rails_helper'

describe "Invoice Items API" do
  it "sends a list a invoice_items" do
    customer = create(:customer)
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:invoice_item, 3, invoice_id: invoice.id, item_id: item.id)

    get '/api/v1/invoice_items'

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(3)
  end

  it "can get one transaction by its id" do
    customer = create(:customer)
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    id = create(:invoice_item, invoice_id: invoice.id, item_id: item.id).id


    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
  end
  #
  it "can find first instance by id" do
    customer = create(:customer)
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    id = create(:invoice_item, invoice_id: invoice.id, item_id: item.id).id


    get "/api/v1/invoice_items/find?id=#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
  end

  it "can find all instances by quantity" do
    customer = create(:customer)
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    quantity = create(:invoice_item, invoice_id: invoice.id, item_id: item.id).quantity

    get "/api/v1/invoice_items/find_all?quantity=#{quantity}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item.first["quantity"]).to eq(quantity)
  end

  it "can return a random invoice_item" do
    customer = create(:customer)
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:invoice_item, 3, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/random"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item.count).to eq(1)

  end
end
