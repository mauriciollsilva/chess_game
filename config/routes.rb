Rails.application.routes.draw do
  resources :games do
    member do
      post 'move_piece'
  resources :players
  resources :pieces do
    member do
      patch :move  # Adicionando a rota para mover peças
    end
  end
  resources :boards

  # Define a rota raiz do aplicativo para a página de índice dos jogos
  root "games#index"
end
