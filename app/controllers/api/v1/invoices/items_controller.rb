module Api
  module V1
    module Invoices
      class ItemsController < ApplicationController

        def index
          render json: Invoice.find(params[:id]).items
        end

      end
    end
  end
end
