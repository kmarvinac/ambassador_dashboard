Rails.application.routes.draw do
  # Routes for the School resource:
  # CREATE
  get "/schools/new", :controller => "schools", :action => "new"
  post "/create_school", :controller => "schools", :action => "create"

  # READ
  get "/schools", :controller => "schools", :action => "index"
  get "/schools/:id", :controller => "schools", :action => "show"

  # UPDATE
  get "/schools/:id/edit", :controller => "schools", :action => "edit"
  post "/update_school/:id", :controller => "schools", :action => "update"

  # DELETE
  get "/delete_school/:id", :controller => "schools", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
