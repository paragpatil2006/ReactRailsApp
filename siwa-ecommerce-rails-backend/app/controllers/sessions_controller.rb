class SessionsController < ApplicationController

    def create 
        user = User.find_by(email: params[:user][:email])
     
        if user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            session[:cart_id] = user.carts.last.id
            cookies[:cart_id] = current_cart.id
            render json: {
                logged_in: true,
                user: user,
                cart: {
                    id: current_cart.id,
                    items: current_cart.items,
                    total: current_cart_total
                }
            }
        end
    end
    
    def logout
        reset_session
        cookies.delete("cart_id")
        render json: {
            logged_out: true
        }
    end
end

# before reset_session
# session[:user_id]
# 1
# cookies[:_session_id]
# "GDqpbwNFHJ+wzjSq1YY0LJSqbgeIeL1HRVnrkdlAy7u9t5Vjyqyl4mpmmqexCbuoSfv4Em51VBKTn9W9P+H0/TH5XHY8eDCMZuMY8FI=--+Ugx3dwhefhG5l8m--O3T1gLtTSuKo61ywmiVfwg=="

#  cookies.encrypted[:_session_id]
# {"session_id"=>"3f910e72c7487b6336f5cb51aaeb3b7a", "user_id"=>1}

# After reset session
# session[:user_id] is deleted in fact. BUT, the cookies[:_session_id] remains and isnt automatically deleted.




# now im going to complete the logout then login and check the values again in the binding.prys i have above:


# session[:user_id]
# 1
# cookies[:_session_id]
# "NnX3Api9a93ukV1bjikpDf/toVVayqyMsZl2T40Ez4p45ITTryUbbt01aK/GH/Oz15F+N9gtiNmjYok+uqcvYwkR8j4A0mTZgXtuOr8=--ph7wcQ7I4gGC1VF/--uEHfADqxAjqgJQVJrT5TCg=="

#  cookies.encrypted[:_session_id]
#  {"session_id"=>"0aa5ede96d61a434a1143cad16f37216", "user_id"=>1}

# After reset session
# session[:user_id] is deleted in fact. BUT, the cookies[:_session_id] remains and isnt automatically deleted.

# What does happen though, is that the session_id is different now. 
# so even though you aren't deleting the cookie called "_session_id"
# by executing reset_session you are actually deleting the session. so the next time the user logs in, 
# a new session will be created and will be deposited in lieu of the old cookie. 

# if someone was trying to be cheeky and use an old cookie, it simply wouldnt match the new session id. 

# you should write a method that compares the cookie to the session data. 