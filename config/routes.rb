Rails.application.routes.draw do
  resources :games
  resources :players
  resources :pieces
  resources :boards

  # Define a rota raiz do aplicativo para a página de índice dos jogos
  root "games#index"
end
