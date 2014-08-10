Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json} do
    resources :stations, only: :index
  end

  resources :stations, only: :index
end
