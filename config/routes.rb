Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # ルートパスをtasksコントローラーのindexアクションに設定
  root "tasks#index"

  # localhost:3000/posts
  resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy] do
    member do
      put :complete 
    end
  end

end
