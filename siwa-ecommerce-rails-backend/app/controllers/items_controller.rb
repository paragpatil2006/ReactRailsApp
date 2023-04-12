class ItemsController < ApplicationController
    def index
        if params["q"] == "greater"
            items = Item.where(["price > ?", "50"])
        elsif params["q"] == "less"
            items = Item.where(["price < ?", "50"])
        else 
            items = Item.all
        end

        render json: {
            items: items
        }
    end
end