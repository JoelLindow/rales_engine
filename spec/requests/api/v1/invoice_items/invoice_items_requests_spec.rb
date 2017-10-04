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

  # it "can get one transaction by its id" do
  #   customer = create(:customer)
  #   merchant = create(:merchant)
  #   invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
  #   id = create(:transaction, invoice_id: invoice.id).id
  #
  #
  #   get "/api/v1/transactions/#{id}"
  #
  #   transaction = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(transaction["id"]).to eq(id)
  # end
  #
  # it "can find first instance by id" do
  #   customer = create(:customer)
  #   merchant = create(:merchant)
  #   invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
  #   id = create(:transaction, invoice_id: invoice.id).id
  #
  #
  #   get "/api/v1/transactions/find?id=#{id}"
  #
  #   transaction = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(transaction["id"]).to eq(id)
  # end
  #
  # it "can find all instances by credit_card_number" do
  #   customer = create(:customer)
  #   merchant = create(:merchant)
  #   invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
  #   credit_card_number = create(:transaction, invoice_id: invoice.id).credit_card_number
  #
  #
  #   get "/api/v1/transactions/find_all?credit_card_number=#{credit_card_number}"
  #
  #   transaction = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(transaction.first["credit_card_number"]).to eq(credit_card_number)
  # end
  # #
  # it "can return a random transaction" do
  #   customer = create(:customer)
  #   merchant = create(:merchant)
  #   invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
  #   create_list(:transaction, 3, invoice_id: invoice.id)
  #
  #   get "/api/v1/transactions/random"
  #
  #   transaction = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(transaction.count).to eq(1)
  # end
  #
  # it "can return the associated invoice" do
  #   customer = create(:customer)
  #   merchant = create(:merchant)
  #   invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
  #   transaction = create(:transaction, invoice_id: invoice.id)
  #
  #   get "/api/v1/transactions/#{transaction.id}/invoice"
  #
  #   invoice_json = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(transaction.invoice).to eq(invoice)
  # end
  #


end
