module Api
  module V1
    class InvoiceItemsController < ApplicationController
      def index
        render json: InvoiceItem.all
      end

      # def show
      #   render json: Invoice.find(params[:id])
      # end
    end
  end
end
