Rails.application.routes.draw do
  get 'consumptions/summaries' => 'consumptions#summaries'
  resources :consumptions
  

  resources :exercises


  get 'dashboards/scratch'
  get 'dashboards/exercise'
  get 'dashboards/consumption'
  get 'dashboards/daily_habits'
  get 'dashboards/sleep'


  root 'exercises#index'
end
