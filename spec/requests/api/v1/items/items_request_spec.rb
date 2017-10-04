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
  #
  # it "can find first instance by id" do
  #   id = create(:item).id
  #
  #   get "/api/v1/items/find?id=#{id}"
  #
  #   item = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(item["id"]).to eq(id)
  # end
  #
  # it "can find all instances by name" do
  #   name = create(:item).name
  #
  #   get "/api/v1/items/find_all?name=#{name}"
  #
  #   item = JSON.parse(response.body)
  #
  #
  #   expect(response).to be_success
  #   expect(item.first["name"]).to eq(name)
  # end

end
