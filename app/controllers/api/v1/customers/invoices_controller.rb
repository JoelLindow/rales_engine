module Api
  module V1
    module Customers
      class InvoicesController < ApplicationController
        def index
          render json: Customer.find(params[:id]).invoices
        end
      end
    end
  end
end
