Rails.application.routes.draw do
root 'sessions#woh'

  resources :buildings
  resources :tenants
  resources :staff_members
  #* =================================================L O G  I N=====
  # get 'login', to: 'application#login'
  # CUSTOM ROUTE - USER CAN VISIT '/login' 

  # I WANT TO FOLLOW CHARLOTTE'S FLOW 
  #  IT'S LESS CONFUSING
  get 'login', to: 'sessions#new'
  # SHOW LOG-IN-VIEW TO USER WITH FORMS
  post 'login', to: 'sessions#create'
  # SUBMIT USER'S PARAMS FROM FORMS TO LOG THEM IN
  delete 'logout', to: 'sessions#destroy'
  # LOG THE USER OUT - DELETE THE USER'S SESSION[:ID]
#* ================================================================
#? ===================================OMNIAUTH L O G   I N==========
  get '/auth/:provider/callback' => 'sessions#omniauth'
  # GOOGLE SENDS A RESPONSE BACK WITH THIS - LOGIC INSIDE SESSIONS_CONTROLLER #OMNIAUTH METHOD
#? ================================================================
#? ===================================OMNIAUTH S I G N  U P==========
  get '/staff_members/:id/step_2' => 'staff_members#step_2'
  # PATCHES OVER TO /STAFF_MEMBER/:ID/EDIT
#? ================================================================
  get 'signup', to: 'staff_members#new'

  # =========================================HUB A C C E S S===========
  get 'hub', to: 'sessions#hub'

  # ====================================================================
                                              # N E S T E D [ R o u t e ]  
    # resources :apartments do
    #   resources :work_order, shallow: true
    # end     
  # IS REALLY GIVING \/
  # /:apartments/ [:new, :create, :show, :edit, :update, :destroy]
  # /:work_orders/, only: [:show, :edit, :update, :destroy]
  # /:apartments/ :work_orders/, only: [:index, :new, :create]
  
  
  resources :apartments do
    resources :work_orders, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  end
  resources :work_orders, only: [:new, :create]

  # +            +            +            +            +            +

  resources :buildings do
    resources :work_orders, only: [:index]
  end

  # =====================================================================
  #                                       A CTIVE R ECORD S C O P E USAGE  
  get '/work_orders', to: 'work_orders#index'
  get '/work_orders/status_pending', to: 'work_orders#status_pending'
  # =====================================================================
end 
