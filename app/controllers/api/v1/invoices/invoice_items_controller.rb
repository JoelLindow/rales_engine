module Api
  module V1
    module Invoices
      class InvoiceItemsController < ApplicationController

        def index
          render json: Invoice.find(params[:id]).invoice_items
        end

      end
    end
  end
end
