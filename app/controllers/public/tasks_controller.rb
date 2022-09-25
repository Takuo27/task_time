# frozen_string_literal: true

class Public::TasksController < ApplicationController
   before_action :authenticate_user!

  # タスク管理画面
  def top
    @user = User.find(params[:id])
    @tasks = @user.tasks.all
    @level = (@user.tasks.where(status: 2).count / 10).floor
    @task_count = @user.tasks.where(status: 2).count
    @next_level = @task_count % 10
    @achievements = @user.achievements.all
    @today_task = @user.tasks.created_today
    @yesterday_task = @user.tasks.created_yesterday
    @this_week_task = @user.tasks.created_this_week
    @last_week_task = @user.tasks.created_last_week
  end

  # タスク一覧
  def index
    @user = current_user
    @tasks = current_user.tasks.all
    @task = Task.new
    @task1 = current_user.tasks.where(category: "study").page(params[:task1_page]).per(2)
    @task2 = current_user.tasks.where(category: "work").page(params[:task2_page]).per(2)
    @task3 = current_user.tasks.where(category: "life").page(params[:task3_page]).per(2)
  end

  # タスク新規登録画面
  def new
    @task = Task.new
  end

  #タスク新規登録
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.save
    redirect_to tasks_path
  end

  # タスク編集画面
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  # タスク完了ボタン（ステータス）
  def done
    @task1 = current_user.tasks.where(category: "study").page(params[:task1_page]).per(2)
    @task2 = current_user.tasks.where(category: "work").page(params[:task1_page]).per(2)
    @task3 = current_user.tasks.where(category: "life").page(params[:task1_page]).per(2)
    @task = Task.find(params[:task_id])
    if @task.status == "waiting"
      @task.update(status: "doing")
      @tasks = Task.all.includes(:user)
      redirect_to tasks_path
    elsif @task.status == "doing"
      @task.update(status: "finished")
      @tasks = Task.all.includes(:user)
      redirect_to tasks_path
    else
      @tasks = Task.all.includes(:user)
     redirect_to tasks_path
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.user_id = current_user.id
    task.destroy
    redirect_to tasks_path
  end

   private
    def task_params
      params.require(:task).permit(:name, :content, :category, :start_time)
    end
end
