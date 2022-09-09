Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :users,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
  }
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get 'users/mypage' => 'users#show', as: 'mypage'
    get 'users/information/edit' => 'users#edit', as: 'edit_information'
    patch 'users/information' => 'users#update', as: 'update_information'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    put 'users/information' => 'users#update'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
  end
end
