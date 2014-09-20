Blog::Application.routes.draw do
  root to: 'entries#index'

  resources :entries
  match "/about", to: 'entries#about'

  match "/tic-tac-toe", to: 'entries#tic_tac_toe'
end
