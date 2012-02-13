Epubdummy::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  namespace :api, defaults: { format: :xml } do
    resources :semapps, only: [:index, :show], shallow: true do
      resources :epubs, only: [:index, :show] do
        resources :scenarios, only: [:index, :show] do
          resources :annotations, except: [:edit, :new]
        end
      end
    end
  end

  root to: redirect('/admin')

end
