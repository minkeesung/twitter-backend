class Api::SessionsController < ApplicationController
    include CurrentUserConcern 

    def create 
        @user = User
                .find_by(email: params["user"]["email"])
                .try(:authenticate, params["user"]["password"])
        
        if @user 
            session[:user_id] = @user.id 
            render '/api/sessions/show'
        else 
            render json: ["Invalid login credentials"], status: 401
        end   
    end 

    def logged_in
        if @current_user 
            render '/api/sessions/logged'
        else 
            render json: { logged_in: false }
        end
    end

    def logout
        reset_session
        render json: { status: 200, logged_out: true }
    end
end