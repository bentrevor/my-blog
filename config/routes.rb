Blog::Application.routes.draw do
  root to: 'entries#index'

  resources :entries

  get "/about",       to: 'status#about'
  get "/tic-tac-toe", to: 'status#tic_tac_toe'
end
