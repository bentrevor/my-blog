Blog::Application.routes.draw do
  root to: 'entries#index'

  resources :entries

  get "/about", to: 'entries#about'
  get "/tic-tac-toe", to: 'entries#tic_tac_toe'
end
