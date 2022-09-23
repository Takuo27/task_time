class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_user, only: [:show, :edit, :update]
  
  def index
    @users = User.page(params[:page]).per(4)
  end

  def show
  @user = User.find(params[:id])
  @tasks = Task.all
  @level = (@user.tasks.where(status: 2).count / 10).floor
  end
  
  
  def update
    if @user.update_without_current_password(user_params)
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end
  
  private
  
  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  
  def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_first_name, :kana_last_name, :email, :phone_number, :image, :is_deleted)
  end
  
  def ensure_user
    @user = User.find(params[:id])
  end
end
