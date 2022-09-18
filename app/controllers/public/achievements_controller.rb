class Public::AchievementsController < ApplicationController
   before_action :authenticate_user!
  
  def new
    @achievement = Achievement.new
  end
  
  def create
    @achievement = Achievement.new(achievement_params)
    @achievement.user_id = current_user.id
    @achievement.save
    redirect_to achievements_path
  end

  def index
    @user = current_user
    @achievements = Achievement.all
    @achievement1 = Achievement.where(category: "study").page(params[:page]).limit(5)
    @achievement2 = Achievement.where(category: "work").page(params[:page]).limit(5)
    @achievement3 = Achievement.where(category: "life").page(params[:page]).limit(5)
  end
  
  def edit
    @achievement = Achievement.find(params[:id])
  end
  
  def update
    @achievement = Achievement.find(params[:id])
    @achievement.update(achievement_params)
    redirect_to achievements_path
  end
  
  private
  def achievement_params
    params.require(:achievement).permit(:name, :content, :category)
  end
  
end
