module Api
  module V1
    module Items
      class MostRevenueController < ApplicationController

        def index
          render json: Item.most_revenue(params[:quantity])
        end

      end
    end
  end
end
