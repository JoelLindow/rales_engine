module Api
  module V1
    module Merchants
      class RevenueController < ApplicationController

        def show
          render json: Merchant.find(params[:id]).total_revenue
        end

        private

        def merchant_params
          params.permit(:id, :name, :created_at, :updated_at)
        end

      end
    end
  end
end
