module Api
  module V1
    module Items
      class FindController < ApplicationController

        def index
          render json: Item.where(merchant_params)
        end

        def show
          render json: Item.find_by(merchant_params)
        end

        private
        def merchant_params
          params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
        end
      end
    end
  end
end
