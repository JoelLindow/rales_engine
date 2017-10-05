module Api
  module V1
    class CustomersController < ApplicationController

      def index
        render json: Customer.all
      end

      def show
        render json: Customer.find(params[:id])
      end

    end
  end
end
