TAHProject::Application.routes.draw do
  
  scope :controller => 'table_dashboard', :path => '/table_dashboard/', :as => :table_dashboard do
    get '/:table_id/edit_table' => :edit_table, :as => :edit_table
    post '/:table_id/update_table' => :update_table, :as => :update_table
    
    get '/:table_id/edit_menu' => :edit_menu, :as => :edit_menu
    post '/:table_id/update_menu' => :update_menu, :as => :update_menu

    get '/:table_id/edit_availabilities' => :edit_availabilities, :as => :edit_availabilities
    post '/:table_id/update_availabilities' => :update_availabilities, :as => :update_availabilities

    get '/:table_id/create_new' => :create_new, :as => :create_new
    
    get '/:table_id/manage' => :manage, :as => :manage

    get '/' => :index, :as => :index
  end

  devise_for :users
  
  get "table_view/table_fiche"
 
  get 'sitemap.xml' => 'sitemaps#sitemap'  
  root :to => 'home#index'
end
