Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "api_help/index", :as => :api_help

  namespace :api, :defaults => {:format => 'json'} do
    scope :module => :v1 do
      post 'get_content_from_url' => 'pages#get_content_from_url' , :as => :get_content_from_url
      get 'list_contents' => 'pages#list_contents' , :as => :list_contents
    end  
  end    
end
