module Api
  module V1
    class TransactionsController < ApplicationController
      def index
        render json: Transaction.all
      end

      def show
        render json: Transaction.find(params[:id])
      end
    end
  end
end
