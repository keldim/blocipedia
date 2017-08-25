Rails.application.routes.draw do
  resources :wikis do
    resources :collaborators
  end
 resources :charges, only: [:new, :create]

post 'charges/refund' => 'charges#refund'


 get 'about' => 'welcome#about'

root 'welcome#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
