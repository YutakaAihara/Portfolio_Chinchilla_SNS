Rails.application.routes.draw do
  
  namespace :public do
    get 'favorite_posts/index'
  end
  scope module: :public do
    resource :owners, only: [:edit, :update]
    get 'mypage' => 'owners#show'
    get 'withdrawal' => 'owners#withdrawal_confirmation'
    patch 'withdrawal' =>'owners#withdrawal'
    
    resources :chinchillas do
      resource :favorite_chinchillas, only: [:index, :create, :destroy]
    end
    
    resources :posts do
      resource :favorite_posts, only: [:index, :create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    
    resources :hospitals
    
    resources :questions do
      resources :question_comments, only: [:create, :destroy]
    end
    patch 'solved' => 'questions#solved'
  end

  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations',
    confirmations: 'owners/confirmations',
    omniauth: 'owners/omniauth',
    unlocks: 'owners/unlocks'
  }

  
  root to: 'homes#top'
  scope :home do
    get 'about' => 'homes#about'
  end
end
