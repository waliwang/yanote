Rails.application.routes.draw do

  #get "/notes",to:"notes#index"
  #get "/notes/new",to:"notes#new"

  get "/", to: "notes#index"
  resources :notes

  get "/hello",to: "pages#main"
  get "/about",to: "pages#about"

  resources :users, only: [:create] do
		collection do
			get :sign_up   # GET /users/sign_up 註冊表單
      get :sign_in   # GET /users/sign_in 登入表單
		end
	end
    post "/users/sign_in", to: "sessions#create"
end
