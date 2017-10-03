module Api
  module V1
    module Merchants
      class InvoicesController < ApplicationController
        def index
          # binding.pry
          render json: Merchant.find(params[:id]).invoices
        end
      end
    end
  end
end
