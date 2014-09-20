Blog::Application.routes.draw do
  root to: 'entries#index'

  get '/archives',    to: 'entries#index'
  get '/entries/:id', to: 'entries#show'

  get "/about",       to: 'status#about'
  get "/tic-tac-toe", to: 'status#tic_tac_toe'
end
