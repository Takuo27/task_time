class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_user, only: [:show, :edit, :update]
  
  def index
    @users = User.page(params[:page])
  end

  def show
   
  end
  
  
  def update
    if @user.update_without_current_password(user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  private
  
  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  
  def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_first_name, :kana_last_name, :email, :phone_number, :birth_date, :image, :is_deleted)
  end
  
  def ensure_user
    @user = User.find(params[:id])
  end
end
