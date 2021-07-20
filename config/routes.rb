Rails.application.routes.draw do
  

  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations',
    confirmations: 'owners/confirmations',
    omniauth: 'owners/omniauth',
    unlocks: 'owners/unlocks'
  }

  scope module: :public do
    resource :owners, only: [:edit, :update]
    get 'mypage' => 'owners#show'
    resources :chinchillas
    resources :posts
    resources :hospitals
    resources :questions

  end
  
  root to: 'homes#top'
  scope :home do
    get 'about' => 'homes#about'
  end
end
