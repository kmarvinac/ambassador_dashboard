Rails.application.routes.draw do
  root :to => "schools#index"
  # Routes for the Invoice resource:
  # CREATE
  get "/invoices/new", :controller => "invoices", :action => "new"
  post "/create_invoice", :controller => "invoices", :action => "create"

  # READ
  get "/invoices", :controller => "invoices", :action => "index"
  get "/invoices/:id", :controller => "invoices", :action => "show"

  # UPDATE
  get "/invoices/:id/edit", :controller => "invoices", :action => "edit"
  post "/update_invoice/:id", :controller => "invoices", :action => "update"

  # DELETE
  get "/delete_invoice/:id", :controller => "invoices", :action => "destroy"
  #------------------------------

  # Routes for the Referral resource:
  # CREATE
  get "/referrals/new", :controller => "referrals", :action => "new"
  post "/create_referral", :controller => "referrals", :action => "create"

  # READ
  get "/referrals", :controller => "referrals", :action => "index"
  get "/referrals/:id", :controller => "referrals", :action => "show"

  # UPDATE
  get "/referrals/:id/edit", :controller => "referrals", :action => "edit"
  post "/update_referral/:id", :controller => "referrals", :action => "update"

  # DELETE
  get "/delete_referral/:id", :controller => "referrals", :action => "destroy"
  #------------------------------

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
