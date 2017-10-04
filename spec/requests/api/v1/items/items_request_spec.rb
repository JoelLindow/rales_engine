require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    merchant = create(:merchant)
    create_list(:item, 3, merchant_id: merchant.id)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it "can get one item by its id" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    id = item.id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end

  it "can find first item by id" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    id = item.id

    get "/api/v1/items/find?id=#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end

  it "can find all instances by id" do
    merchant = create(:merchant)
    item1, item2, item3 = create_list(:item, 3, merchant_id: merchant.id)
    id = item1.id

    get "/api/v1/items/find_all?id=#{id}"

    items = JSON.parse(response.body)


    expect(response).to be_success
    expect(items.first["id"]).to eq(id)
  end

  it "can find first item by name" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    name = item.name

    get "/api/v1/items/find?name=#{name}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(name)
  end

  it "can find all instances by name" do
    merchant = create(:merchant)
    item1, item2, item3 = create_list(:item, 3, merchant_id: merchant.id)
    name = item1.name

    get "/api/v1/items/find_all?name=#{name}"

    items = JSON.parse(response.body)


    expect(response).to be_success
    expect(items.first["name"]).to eq(name)
  end
end
