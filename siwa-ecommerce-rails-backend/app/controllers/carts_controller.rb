class CartsController < ApplicationController

    # include an action called delete_item_from_cart
    # it will receive params of the item id. it should search current_cart.items, 
    # remove it from the list, then render the updated cart as json
    def add_item_to_cart
        item = Item.find(params["item"]["id"]) if params["item"]["id"]
        if cookies[:cart_id]
            if check_cart_cookie
                current_cart.items << item 
                current_cart.save
            end
        else 
            cart = Cart.create 
            session[:cart_id] = cart.id
            cookies[:cart_id] = cart.id
            current_cart.items << item 
            current_cart.save
        end 

        render json: {
            cart: {
                id: current_cart.id,
                items: current_cart.items,
                total: current_cart_total
            }
        }  
    end

    def remove_item_from_cart
        item = Item.find(params[:item][:itemId])
        # cart = Cart.find(params[:cart_id])
        # if current_user 
        #     if check_session_cookie && check_cart_cookie && params[:cart_id] == current_cart.id
        #         current_cart.items = current_cart.items.filter { |i| i.id != item.id }
        #         current_cart.save
        #     end
        # elsif check_cart_cookie && params[:cart_id] == current_cart.id
        #     current_cart.items = current_cart.items.filter { |i| i.id != item.id }
        #     current_cart.save
        # end
       
     
        if check_cart_cookie && params[:cart_id].to_i == current_cart.id
            # check to see that the cart claimed in cookie is actually referring to the current_cart
            current_cart.items.delete(item)
            current_cart.save
        end
        
        render json: {
            cart: {
                id: current_cart.id,
                items: current_cart.items,
                total: current_cart_total
            }
        }  
    end
end