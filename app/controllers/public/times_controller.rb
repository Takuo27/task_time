class Public::TimesController < ApplicationController
  
  def top
    @user = current_user
  end
  
  def new
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_first_name, :kana_last_name, :email, :phone_number, :birth_date, :image, :is_deleted)
  end
  
end
