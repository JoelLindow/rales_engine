module Api
  module V1
    module Merchants
      class MostItemsController < ApplicationController

        def index
          render json: Merchant.most_items(params[:quantity])
        end

        private

        def merchant_params
          params.permit(:id, :name, :created_at, :updated_at)
        end

      end
    end
  end
end
