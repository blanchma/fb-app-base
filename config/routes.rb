FbApp::Application.routes.draw do
  get "/auth/facebook/callback" => "sessions#create"
  get "/auth/failure" => "sessions#failure"
  get "/auth/deauthorize" => "sessions#deauthorize"
  get "/redirected" => "application#safari_return"

  get "/signin" => "sessions#new", as: :signin
  get "/signout" => "sessions#destroy", as: :signout
end
