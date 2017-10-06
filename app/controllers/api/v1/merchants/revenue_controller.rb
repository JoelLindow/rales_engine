module Api
  module V1
    module Merchants
      class RevenueController < ApplicationController

        def show
          if params.has_key?(:date)
            render json: Merchant.find(params[:id]).total_revenue(params[:date]), serializer: TotalRevenueSerializer
          else
            render json: Merchant.find(params[:id]).total_revenue, serializer: TotalRevenueSerializer
          end
        end

        private

        def merchant_params
          params.permit(:id, :name, :created_at, :updated_at)
        end

      end
    end
  end
end
