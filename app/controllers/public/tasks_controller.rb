class Public::TasksController < ApplicationController
   before_action :authenticate_user!
  
  # タスク管理画面
  def top
    @tasks = Task.all
    @user = current_user
    @level = (current_user.tasks.where(status: 2).count / 10).floor
    @task_count = current_user.tasks.where(status: 2).count
    @x = @task_count % 10
    @achievements = Achievement.all
    @today_task = @tasks.created_today
    @yesterday_task = @tasks.created_yesterday
    @this_week_task = @tasks.created_this_week
    @last_week_task = @tasks.created_last_week
  end
  
  # タスク一覧
  def index
    @user = current_user
    @tasks = Task.all
    @task = Task.new
    @task1 = Task.where(category: "study").page(params[:page]).limit(2)
    @task2 = Task.where(category: "work").page(params[:page]).limit(2)
    @task3 = Task.where(category: "life").page(params[:page]).limit(2)
  end
  
  # タスク新規登録画面
  def new
    @task = Task.new
  end

  #タスク新規登録
  def create
    # binding.pry
    #byebug
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
    @task = Task.find(params[:id])
    @task.user_id = current_user.id
    if @task.status == "waiting"
      @task.update(status: "doing")
      @tasks = Task.all.includes(:user)
      render :index
    else 
      @task.update(status: "finished")
      @tasks = Task.all.includes(:user)
      render :index
    end
  end

  def destroy
    # byebug
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
