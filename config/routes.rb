Rails.application.routes.draw do
  devise_for :users,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
 
 
  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    get '/' => 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
  end
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get 'users/mypage' => 'users#show', as: 'mypage'
    get 'users/information/edit' => 'users#edit', as: 'edit_information'
    patch 'users/information' => 'users#update', as: 'update_information'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    put 'users/information' => 'users#update'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
    
    resources :tasks, only: [:new, :index, :edit, :update, :destroy]
    get 'tasks/top' => 'tasks#top'
    post '/tasks' => 'tasks#create'
    # delete '/tasks' => 'tasks#destroy', as: 'destroy_task'
    post '/tasks/:id/done' => 'tasks#done',   as: 'done'
    
    resources :achievements, only: [:new, :index, :create, :edit, :update, :destroy]
    post '/achievements' => 'achievements#create'
    # delete '/achievements' => 'achievements#destroy'
  end
  
end
