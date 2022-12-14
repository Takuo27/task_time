# frozen_string_literal: true

class Public::AchievementsController < ApplicationController
   before_action :authenticate_user!

  def new
    @achievement = Achievement.new
  end
  
  # 目標新規登録
  def create
    @achievement = Achievement.new(achievement_params)
    @achievement.user_id = current_user.id
    @achievement.save
    redirect_to achievements_path
  end
  
  # 目標一覧画面
  def index
    @user = current_user
    @achievements = current_user.achievements.all
    @achievement_studies = current_user.achievements.where(category: "study").page(params[:achievement_studies_page]).per(3)
    @achievement_works = current_user.achievements.where(category: "work").page(params[:achievement_works_page]).per(3)
    @achievement_lifes = current_user.achievements.where(category: "life").page(params[:achievement_lifes_page]).per(3)
  end

  # 目標編集画面
  def edit
    @achievement = Achievement.find(params[:id])
  end

  # 
  def update
    @achievement = Achievement.find(params[:id])
    @achievement.update(achievement_params)
    redirect_to achievements_path
  end

  def destroy
    achievement = Achievement.find(params[:id])
    achievement.user_id = current_user.id
    achievement.destroy
    redirect_to achievements_path
  end

  private
  def achievement_params
    params.require(:achievement).permit(:name, :content, :category)
  end
end
