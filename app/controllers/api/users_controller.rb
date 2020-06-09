class Api::UsersController < ApplicationController
    include CurrentUserConcern 

    def index 
        users = User.all
        @users = users.select {|user| user.id != current_user.id}
        @current_user = current_user
    end

    def show 
        user = User.find_by(id: params[:id])
        @tweets = user.tweets
        @following = current_user.following?(user)
        render '/api/tweets/index'
    end 
end