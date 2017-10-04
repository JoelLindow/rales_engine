module Api
  module V1
    module Transactions
      class InvoicesController < ApplicationController
        def show
          # binding.pry
          render json: Transaction.find(params[:id]).invoice
        end
      end
    end
  end
end
