module Api
  module V1
    module Items
      class InvoiceItemsController < ApplicationController

        def index
          render json: InvoiceItem.where(item_id: params[:id])
        end

      end
    end
  end
end
