# frozen_string_literal: true

Rails.application.routes.draw do
  # デバイスUser側
  devise_for :users,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
  }
  # デバイスAdmin側
  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
  }
  # Admin側ルーティング
  namespace :admin do
    get "/" => "homes#top"
    resources :users, only: [:index, :show, :edit, :update] do
      patch "withdraw"
    end
  end

  # 会員側ルーティング
  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"

    resources :users, only: [:show, :edit, :index, :update] do
      resource :relationships, only: [:create, :destroy]
      member do
        get  "follows"
        get "followers"
        get "unsubscribe"
        patch "withdraw"
      end
    end

    resources :tasks, only: [:new, :index, :edit, :create, :update, :destroy] do
      post "/done" => "tasks#done",   as: "done"
      member do
        get "top", to: "tasks#top"
      end
    end

    resources :achievements, only: [:new, :index, :create, :edit, :update, :destroy]
    post "/achievements" => "achievements#create"
  end
end
