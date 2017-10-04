module Api
  module V1
    module Invoices
      class TransactionsController < ApplicationController
        def index
          # binding.pry
          render json: Invoice.find(params[:id]).transactions
        end
      end
    end
  end
end
