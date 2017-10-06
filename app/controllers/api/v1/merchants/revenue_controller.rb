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

        def index
          if params.has_key?(:date)
            render json: Merchant.revenue(params[:date]), serializer: RevenueSerializer
          else
            render json: Merchant.revenue
          end
        end


      end
    end
  end
end
