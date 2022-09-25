class Public::RelationshipsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @user = User.find(params[:user_id])
        relationship = Relationship.new(follower_id: current_user.id, followed_id: params[:user_id])
        relationship.save
        redirect_to request.referrer 
    end
    
    def destroy
        relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:user_id])
        relationship.destroy
        redirect_to request.referrer 
    end
    
    def followings
        @user = User.find(params[:id])
        @users = @user.followings.page(params[:page]).per(8)
    end
    
    def followers
        @user = User.find(params[:id])
        @users = @user.followers.page(params[:page]).per(8)
    end
end
