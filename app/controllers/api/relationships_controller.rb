class Api::RelationshipsController < ApplicationController
    def create
      user = User.find(params[:followee_id])
      current_user.follow(user)
      @current_user = current_user
      @user = user
      render '/api/relationships/show'
    end
  
    def destroy
      current_user.unfollow(params[:id])
      render json: {id: params[:id]}
    end

    def show
        user = User.find_by(id: params[:id])
        following = current_user.following?(user)
        render json: {following: following}
    end 
  end
  