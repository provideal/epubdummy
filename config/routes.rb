Epubdummy::Application.routes.draw do

  namespace :api do
    get 'semapp/:semapp_id/epubs'     => 'epub#index'
    get 'semapp/:semapp_id/epubs/:id' => 'epub#show'

    post 'semapp/:semapp_id/epubs/:epub_id/annotations'     => 'annotation#create'
    post 'semapp/:semapp_id/epubs/:epub_id/annotations/:id' => 'annotation#update'
  end

end
