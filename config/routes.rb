Epubdummy::Application.routes.draw do

  namespace :api do
    get 'semapps'                      => 'semapp#index'
    get 'semapps/:semapp_id'           => 'semapp#show'

    post 'semapps/:semapp_id/epubs/:epub_id/annotations'     => 'annotation#create'
    post 'semapps/:semapp_id/epubs/:epub_id/annotations/:id' => 'annotation#update'
  end

end
