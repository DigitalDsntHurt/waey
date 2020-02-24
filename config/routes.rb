Rails.application.routes.draw do
  
  get 'review/this_week'
  get 'review/last_week'
  get 'review/trailing_seven_days'
  get 'dailies/alcohol_index' => 'dailies#alcohol_index'
  get 'dailies/alcohol_summary' => 'dailies#alcohol_summary'
  get 'dailies/mark_done' => 'dailies#mark_done'
  get 'dailies/mark_undone' => 'dailies#mark_undone'
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
