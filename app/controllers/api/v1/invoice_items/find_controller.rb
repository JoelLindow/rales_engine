module Api
  module V1
    module InvoiceItems
      class FindController < ApplicationController

        def index
          render json: InvoiceItem.where(invoice_item_params)
        end

        def show
          render json: InvoiceItem.find_by(invoice_item_params)
        end

        private

        def invoice_item_params
          if params[:unit_price]
            params[:unit_price] = (params[:unit_price].to_f * 100).round
          end
          params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
        end

      end
    end
  end
end
