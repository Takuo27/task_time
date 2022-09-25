Rails.application.routes.draw do
  
  # デバイスUser側
  devise_for :users,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  # デバイスAdmin側
  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
  }
  # Admin側ルーティング
  namespace :admin do
    get '/' => 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
  end
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    
    resources :users, only: [:show, :edit, :index, :update] do
      resource :relationships, only: [:create, :destroy]
      member do
        get  "follows"
        get "followers"
        get "unsubscribe"
        patch "withdraw"
      end
    end
    # put 'users/information' => 'users#update'
    # get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    # patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
    # resources :users, only: [:show, :edit, :update] do
    # # get 'users/mypage' => 'users#show', as: 'mypage'
    # # get 'users/information/edit' => 'users#edit', as: 'edit_information'
    # # patch 'users/information' => 'users#update', as: 'update_information'
    #   # put 'users/information' => 'users#update'
    #   # get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    #   # patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
    #     resource :relationships, only: [:create, :destroy]
    #     get 'followings' => 'relationships#followings', as: 'followings'
    #     get 'followers' => 'relationships#followers', as: 'followers'
    # end
    
    resources :tasks, only: [:new, :index, :edit, :create, :update, :destroy] do
      # post '/tasks' => 'tasks#create'
      post '/done' => 'tasks#done',   as: 'done'
      member do
        get 'top', to: 'tasks#top'
      end
    end 
    
    resources :achievements, only: [:new, :index, :create, :edit, :update, :destroy]
    post '/achievements' => 'achievements#create'
  end
  
end
