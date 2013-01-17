Blog::Application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  if Entry.count == 0
    root to: 'entries#index'
  else
    root to: 'entries#show', id: Entry.last.id
  end
  
  resources :entries
  match "/about", to: 'entries#about'

end
