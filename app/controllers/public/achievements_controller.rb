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
    @achievements = Achievement.all
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
