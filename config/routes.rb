Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    #RESTful index
    get "/places", controller: "places", action: "index"
    #RESTful show
    get "/places/:id", controller: "places", action: "show"
    #RETSful create
    post "/places", controller: "places", action: "create"
    #RESTful update
    patch "/places/:id", controller: "places", action: "update"
    #RESTful delete
    delete "/places/:id", controller: "places", action: "destroy"
  end
end
