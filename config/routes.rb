Rails.application.routes.draw do
  
  get "/blogs", to: "blogs#index"
  post "/blogs", to: "blogs#create"
  patch "/blogs/:id", to: "blogs#update"
  delete "/blogs/:id", to: "blogs#destroy"


end
