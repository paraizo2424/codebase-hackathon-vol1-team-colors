Rails.application.routes.draw do
  resources :subjects
  resources :square_record_subjects
  resources :studied_records, except: :destroy
  delete '/studied_records', to: 'studied_records#destroy'
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'registrations'
  }
  get '/users', to: 'users#show'
  patch '/users/update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
