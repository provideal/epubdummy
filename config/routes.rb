Epubdummy::Application.routes.draw do

  namespace :api do
    resources :semapps, only: [:index, :show] do
      resources :epubs, only: [:index, :show] do
        resources :annotations, only: [:index, :create, :update, :destroy]
      end
    end
  end

end
