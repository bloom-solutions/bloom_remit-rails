BloomRemit::Engine.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :txns, only: %i[update]
    end
  end
end
