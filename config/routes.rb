Rails.application.routes.draw do
  devise_for :owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  scope :home do
    get 'about' => 'homes#about'
  end
end
