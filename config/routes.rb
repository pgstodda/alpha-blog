Rails.application.routes.draw do
  root("posts#index")
  get("/about", to: "posts#about")
  #resources :articles, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  resources :articles
end
