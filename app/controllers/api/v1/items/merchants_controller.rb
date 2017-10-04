module Api
  module V1
    module Items
      class MerchantsController < ApplicationController

        def show
          render json: Item.find_by(item_params).merchant
        end

        private

        def item_params
          params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
        end

      end
    end
  end
end
