module Api
  module V1
    module InvoiceItems
      class ItemsController < ApplicationController

        def show
          render json: InvoiceItem.find(params[:id]).item
        end

      end
    end
  end
end
