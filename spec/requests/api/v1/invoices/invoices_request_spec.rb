require 'rails_helper'

describe "Invoices API" do
  it "sends a list of invoices" do
    customer = create(:customer)
    merchant = create(:merchant)
    create_list(:invoice, 3, merchant_id: merchant.id, customer_id: customer.id)

    get '/api/v1/invoices'

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(3)
  end

  it "can get one invoice by its id" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    id = invoice.id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(id)
  end

  it "can find first instance by id" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    id = invoice.id

    get "/api/v1/invoices/find?id=#{id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(id)
  end

  it "can find first instance by customer" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    customer_id = customer.id

    get "/api/v1/invoices/find?customer=#{customer_id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["customer_id"]).to eq(customer_id)
  end

  it "can find first instance by merchant" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    merchant_id = merchant.id

    get "/api/v1/invoices/find?merchant=#{merchant_id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["merchant_id"]).to eq(merchant_id)
  end

end
