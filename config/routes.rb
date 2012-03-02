TAHProject::Application.routes.draw do

  devise_for :admin_users

  scope :controller => 'table_dashboard', :path => '/table_dashboard/', :as => :table_dashboard do

    get '/:table_id/edit_table' => :edit_table, :as => :edit_table
    put '/:table_id/update_table' => :update_table, :as => :update_table    
    get '/:table_id/edit_availabilities' => :edit_availabilities, :as => :edit_availabilities
    # post '/:table_id/update_availabilities' => :update_availabilities, :as => :update_availabilities
    post '/create_new' => :create_new, :as => :create_new
    get '/:table_id/manage' => :manage, :as => :manage

    scope :controller => 'menu_dashboard', :path => '/:table_id/menu', :as => :menu do
      get '/index' => :index, :as => :index
      get '/:menu_id/edit' => :edit, :as => :edit
      get '/create_new' => :create_new, :as => :create_new
      delete '/:menu_id/delete' => :delete, :as => :delete
      put '/:menu_id/update' => :update, :as => :update
      
      scope :controller => 'dish_dashboard', :path => '/:menu_id/dish/', :as => :dish do
        get '/index' => :index, :as => :index
        get '/:dish_id/edit' => :edit, :as => :edit
        put '/:dish_id/update' => :update, :as => :update
        delete '/:dish_id/delete' => :delete, :as => :delete
        post '/create' => :create, :as => :create
        
      end
    end

    scope :controller => 'availability', :path => '/:table_id/availability', :as => :availability do
      post '/update' => :update, :as => :update
      post '/create' => :create, :as => :create
      post '/delete' => :delete, :as => :delete
    end

    get '/' => :index, :as => :index
  end

  get "table_view/table_fiche"

  scope :controller => 'table_view', :path => '/table_view', :as => :table_view do
    get '/table_sample' => :table_sample, :as => :sample
  end

  namespace :misc do
    scope :controller => 'dish_sample', :path => '/path' do
      get 'autocomplete_dish_sample_title', :as => :autocomplete_dish_sample_title
    end
  end

  devise_for :users
  

 
  get 'sitemap.xml' => 'sitemaps#sitemap'  
  root :to => 'home#index'
end
