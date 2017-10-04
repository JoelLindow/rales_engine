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

  it "returns invoice_items" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    item = create(:item, merchant_id: merchant.id)
    invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id)
    invoice_id = invoice.id

    get "/api/v1/invoices/#{invoice_id}/invoice_items"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(1)
  end

  it "returns items" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    item1, item2, item3 = create_list(:item, 3, merchant_id: merchant.id)
    create(:invoice_item, item_id: item1.id, invoice_id: invoice.id)
    create(:invoice_item, item_id: item2.id, invoice_id: invoice.id)
    create(:invoice_item, item_id: item3.id, invoice_id: invoice.id)
    invoice_id = invoice.id

    get "/api/v1/invoices/#{invoice_id}/items"

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it "returns customer" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    item1, item2, item3 = create_list(:item, 3, merchant_id: merchant.id)
    create(:invoice_item, item_id: item1.id, invoice_id: invoice.id)
    create(:invoice_item, item_id: item2.id, invoice_id: invoice.id)
    create(:invoice_item, item_id: item3.id, invoice_id: invoice.id)
    invoice_id = invoice.id

    get "/api/v1/invoices/#{invoice_id}/customer"

    expect(response).to be_success

    customer_json = JSON.parse(response.body)

    expect(customer_json["first_name"]).to eq(customer.first_name)
  end

  it "returns merchant" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    item = create(:item, merchant_id: merchant.id)
    create(:invoice_item, item_id: item.id, invoice_id: invoice.id)
    invoice_id = invoice.id

    get "/api/v1/invoices/#{invoice_id}/merchant"

    expect(response).to be_success

    merchant_json = JSON.parse(response.body)

    expect(merchant_json["name"]).to eq(merchant.name)
  end

end
