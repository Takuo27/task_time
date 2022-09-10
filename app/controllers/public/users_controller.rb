class Public::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_current_user
    
    def show
    end
    
    def edit
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
    
    def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_first_name, :kana_last_name, :email, :phone_number, :birth_date, :image, :is_deleted)
    end
end
