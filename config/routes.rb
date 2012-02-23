TAHProject::Application.routes.draw do

  scope :controller => 'table_dashboard', :path => '/table_dashboard/', :as => :table_dashboard do

    get '/:table_id/edit_table' => :edit_table, :as => :edit_table
    put '/:table_id/update_table' => :update_table, :as => :update_table    
    get '/:table_id/edit_availabilities' => :edit_availabilities, :as => :edit_availabilities
    post '/:table_id/update_availabilities' => :update_availabilities, :as => :update_availabilities
    get '/create_new' => :create_new, :as => :create_new
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
        get '/create_new' => :create_new, :as => :create_new
        
      end
    end
    get '/' => :index, :as => :index
  end


  devise_for :users
  
  get "table_view/table_fiche"
 
  get 'sitemap.xml' => 'sitemaps#sitemap'  
  root :to => 'home#index'
end
