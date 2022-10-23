Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  resources :quotes do
    resources :line_items_dates, except: [:index, :show]
  end
end
