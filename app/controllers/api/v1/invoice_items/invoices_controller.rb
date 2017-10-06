module Api
  module V1
    module InvoiceItems
      class InvoicesController < ApplicationController

        def show
          render json: InvoiceItem.find(params[:id]).invoice
        end

      end
    end
  end
end
