BloomRemit::Engine.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :txns do
        member do
          post "/", to: "txns#post_update"
        end
      end
    end
  end
end
