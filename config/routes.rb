Rails.application.routes.draw do
  resources :consumptions
  root 'exercises#index'

  get 'dashboards/scratch'
  get 'dashboards/exercise'
  get 'dashboards/consumption'
  get 'dashboards/daily_habits'
  get 'dashboards/sleep'
  resources :exercises
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
