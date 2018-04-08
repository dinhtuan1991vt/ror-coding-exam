Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'developers', to: 'developers#index'
  root 'developers#index'

  namespace :api do
    namespace :v1 do
      get 'developers', to: 'developers#index'
    end
  end
end