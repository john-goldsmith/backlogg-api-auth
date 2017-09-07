# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# See http://andrewberls.com/blog/post/api-versioning-with-rails-4

Rails.application.routes.draw do

  # constraints subdomain: 'auth' do
    namespace :v1 do
      # get "/", to: "auth#index"
      # get "/:id", to: "auth#show", constraints: { id: /\d+/ }
      # put "/:id", to: "auth#update"
      # delete "/:id", to: "auth#destroy"
      # post "/", to: "auth#create"
      post "/issue", to: "auth#issue"
      post "/decode", to: "auth#decode"
      get "/docs", to: "docs#index"
    end
  # end

end
