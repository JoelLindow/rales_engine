require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(3)
  end

  it "can get one customer by its id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can find first instance by id" do
    id = create(:customer).id

    get "/api/v1/customers/find?id=#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can find all instances by first name" do
    create_list(:customer, 3)
    first_name = create(:customer).first_name

    get "/api/v1/customers/find_all?first_name=#{first_name}"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.first["first_name"]).to eq(first_name)
    expect(customers.count).to eq(4)
  end

  it "can return a random customer" do
    create_list(:customer, 3)

    get "/api/v1/customers/random"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer.count).to eq(1)
  end
  
end
