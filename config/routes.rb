Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  
  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations',
    confirmations: 'owners/confirmations',
    omniauth: 'owners/omniauth',
    unlocks: 'owners/unlocks'
  }
  namespace :public do
    get 'favorite_posts/index'
  end
  scope module: :public do
    resources :owners, only: [:show, :edit, :update]
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
    
    get   'contact' => 'contacts#new' 
    post  'contact/confirm' => 'contacts#confirm' 
    post  'contact/thanks'  => 'contacts#thanks'
  end


  
  root to: 'homes#top'

end
