module Api
  module V1
    module Items
      class MostItemsController < ApplicationController

        def index
          render json: Item.most_items(params[:quantity])
        end

      end
    end
  end
end
