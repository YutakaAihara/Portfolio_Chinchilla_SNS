Rails.application.routes.draw do
  
  namespace :public do
    get 'community/index'
  end
  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations',
    confirmations: 'owners/confirmations',
    omniauth: 'owners/omniauth',
    unlocks: 'owners/unlocks'
  }
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  
  devise_scope :admin do
    get 'admin', to: 'admins/sessions#new'
  end
  

  namespace :admin do
    resources :hospitals, only: [:index, :destroy]
    
    resources :chinchillas, only: [:index, :destroy]
    
    resources :posts, only: [:index, :destroy, :show] do
      resources :post_comments, only: [:destroy]
    end
    
    resources :owners, only: [:index, :destroy]
    
    resources :questions, only: [:index, :destroy, :show] do
      resources :question_comments, only: [:destroy]
    end
    
  end

    
  
  scope module: :public do
    resources :owners, only: [:show, :edit, :update]
    get 'confirmation/:id' => 'owners#withdrawal_confirmation', as: 'confirm_unsubscribe'
    patch 'withdraw/:id' => 'owners#withdrawal', as: 'withdraw_owner'
    put 'withdraw/:id' => 'ownerss#withdraw'    
    
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
    
    get   'contact' => 'contacts#new' 
    post  'contact/confirm' => 'contacts#confirm' 
    post  'contact/thanks'  => 'contacts#thanks'
  end


  
  root to: 'homes#top'

end
