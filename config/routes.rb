Rails.application.routes.draw do
  
  namespace :public do
    get 'questions/index'
    get 'questions/new'
    get 'questions/show'
    get 'questions/edit'
  end
  namespace :public do
    get 'hospitals/index'
    get 'hospitals/new'
    get 'hospitals/show'
    get 'hospitals/edit'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/new'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :public do
    get 'chinchillas/index'
    get 'chinchillas/new'
    get 'chinchillas/show'
    get 'chinchillas/edit'
  end
  namespace :public do
    get 'owners/index'
    get 'owners/show'
    get 'owners/edit'
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
