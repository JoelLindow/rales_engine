module Api
  module V1
    class ItemsController < ApplicationController

      def index
        render json: Item.all
      end

      def show
        render json: Item.find(params[:id])
      end

    end
  end
end
