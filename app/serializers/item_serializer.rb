class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :descrition, :unit_price, :merchant_id
end
