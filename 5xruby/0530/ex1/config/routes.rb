Rails.application.routes.draw do
	get 'bmi.php', to: 'lottery#bmi'
	post 'bmi_result.php', to: 'lottery#bmi_result'
  resources :products #, only: [:index]
  get '/lottery', to:'lottery#index'
  # resource :account # 無 index,不常用 
  # 常用 resources, only:[...]
  # 或 resource, except:[...]
end
