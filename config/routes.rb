Rails.application.routes.draw do
  resources :items_branches
  post "items_hists/:id/replay" => "items_hists#replay", as: :items_hist_replay
  post "items_hists/:id/checkout" => "items_hists#checkout", as: :items_hist_checkout
  resources :items_hists
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
