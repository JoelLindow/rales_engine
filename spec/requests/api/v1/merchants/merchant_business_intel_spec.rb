require 'rails_helper'

describe "Merchant Business Intelligence" do
  it " returns the top x merchants ranked by total revenue" do
    customer = create(:customer)
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)

    invoice1 = create(:invoice, customer_id: customer.id, merchant_id: merchant1.id)
    invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 2, unit_price: 100)
    transaction1 = create(:transaction, invoice_id: invoice1.id, result: "success")

    invoice2 = create(:invoice, customer_id: customer.id, merchant_id: merchant2.id)
    invoice_item2 = create(:invoice_item, invoice_id: invoice2.id, quantity: 1, unit_price: 100)
    transaction2 = create(:transaction, invoice_id: invoice2.id, result: "success")

    invoice3 = create(:invoice, customer_id: customer.id, merchant_id: merchant3.id)
    invoice_item3 = create(:invoice_item, invoice_id: invoice3.id, quantity: 3, unit_price: 100)
    transaction3 = create(:transaction, invoice_id: invoice3.id, result: "success")


  end


end
