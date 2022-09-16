class Public::TasksController < ApplicationController
   before_action :authenticate_user!
  
  # タスク管理画面
  def top
    @tasks = Task.all
    @user = current_user
    @achievements.all
  end
  
  # タスク一覧
  def index
    @tasks = Task.all
    
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
      params.require(:task).permit(:name, :content, :category)
    end
end
