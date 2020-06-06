class Api::UsersController < ApplicationController
    include CurrentUserConcern 

    def index 
        users = User.all
        @users = users.select {|user| user.id != current_user.id}
        @current_user = current_user
    end
end