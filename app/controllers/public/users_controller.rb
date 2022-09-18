class Public::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_current_user
    
    def show
        @user = current_user
        @level = (current_user.tasks.where(status: 2).count / 10).floor
        # @x = @level % 10
        @task_count = current_user.tasks.where(status: 2).count
        @x = @task_count % 10
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user.update(user_params)
        redirect_to mypage_path(@user.id)
    end
    
    
    def unsubscribe
    end
    
    def withdraw
        @user.update(is_deleted: true)
        reset_session
        redirect_to root_path
    end
    
    private
    
    def set_current_user
        @user = current_user
    end
    
    def update_resource(resource, params)
        resource.update_without_password(params)
    end
    
    def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_first_name, :kana_last_name, :email, :phone_number, :birth_date, :image, :is_deleted)
    end
end
