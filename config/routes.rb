Rails.application.routes.draw do
  
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
