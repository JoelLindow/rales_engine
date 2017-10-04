module Api
  module V1
    module Invoices
      class FindController < ApplicationController

        # def index
        #   render json: Merchant.where(merchant_params)
        # end

        def show
          render json: Invoice.find_by(invoice_params)
        end

        private

        def invoice_params
          params.permit(:id, :id_customers, :id_merchants, :status, :created_at, :updated_at)
        end

      end
    end
  end
end
