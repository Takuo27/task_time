class Public::UsersController < ApplicationController
    before_action :authenticate_user!
    
    
    def show
       @user = current_user
        
    end
    
    def edit
        @user = current_user
    end
    
    def update
    end
    
    
    def unsubscribe
        @user = current_user
    end
    
    def withdraw
        @user = current_user
        @user.update(is_deleted: true)
        reset_session
        redirect_to root_path
    end
    
    private
    
    def userr_params
    params.require(:user).permit(:last_name, :first_name, :kana_first_name, :kana_last_name, :email, :phone_number, :birthday, :image, :is_deleted)
    end
end
