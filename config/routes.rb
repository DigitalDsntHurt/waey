Rails.application.routes.draw do
  
  get 'dailies/alcohol_index' => 'dailies#alcohol_index'
  get 'dailies/alcohol_summary' => 'dailies#alcohol_summary'
  resources :dailies
  

  get 'consumptions/summaries' => 'consumptions#summaries'
  resources :consumptions
  

  resources :exercises


  get 'dashboards/scratch'
  get 'dashboards/exercise'
  get 'dashboards/consumption'
  get 'dashboards/daily_habits'
  get 'dashboards/sleep'
  get 'dashboards/today'


  root 'dashboards#today'
end
