class Public::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_current_user
    
    def index
        @users = User.page(params[:page]).per(4)
        @tasks = @user.tasks.all
    end
    def show
        @user = User.find(params[:id])
        @level = (@user.tasks.where(status: 2).count / 10).floor
        @task_count = @user.tasks.where(status: 2).count
        @x = @task_count % 10
    end
    
    def edit
       
    end
    
    def update
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end
    
    
    def unsubscribe
    end
    
    def withdraw
        @user.update(is_deleted: true)
        reset_session
        redirect_to root_path
    end
    
    def follows
        @user = User.find(params[:id])
        @users = @user.followings.page(params[:page]).per(8)
    end
    
    
    def followers
        @user = User.find(params[:id])
        @users = @user.followers.page(params[:page]).per(8)
    end
    
    private
    
    def set_current_user
        @user = current_user
    end
    
    def update_resource(resource, params)
        resource.update_without_password(params)
    end
    
    def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_first_name, :kana_last_name, :email, :phone_number, :image, :is_deleted)
    end
end
