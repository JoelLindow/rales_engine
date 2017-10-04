module Api
  module V1
    module Invoices
      class CustomersController < ApplicationController
        def show
          render json: Invoice.find(params[:id]).customer
        end
      end
    end
  end
end
