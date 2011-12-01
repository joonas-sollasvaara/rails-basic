Library::Application.routes.draw do
  
  resources :books
  
  match 'site/isbn' => 'site#isbn', :via => [:get, :post], :as => :isbn_validator

  root :to => 'site#index'
  
end
