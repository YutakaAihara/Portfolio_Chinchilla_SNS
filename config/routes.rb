Rails.application.routes.draw do
  
  scope module: :public do
    resource :owners, only: [:edit, :update]
    get 'mypage' => 'owners#show'
    get 'withdrawal' => 'owners#withdrawal_confirmation'
    patch 'withdrawal' =>'owners#withdrawal'
    resources :chinchillas
    resources :posts
    resources :hospitals
    resources :questions
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
