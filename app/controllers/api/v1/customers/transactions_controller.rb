module Api
  module V1
    module Customers
      class TransactionsController < ApplicationController
        def index
          render json: Customer.find(params[:id]).transactions
        end
      end
    end
  end
end
