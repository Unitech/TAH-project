TAHProject::Application.routes.draw do

  devise_for :admin_users
  devise_for :users

  #
  # Table Dashboard
  #
  scope :controller => 'table_dashboard', :path => '/table_dashboard/', :as => :table_dashboard do

    get '/:table_id/edit_table' => :edit_table, :as => :edit_table
    put '/:table_id/update_table' => :update_table, :as => :update_table    
    get '/:table_id/edit_availabilities' => :edit_availabilities, :as => :edit_availabilities
    post '/create_new' => :create_new, :as => :create_new
    get '/:table_id/manage' => :manage, :as => :manage
    delete '/:table_id/destroy' => :destroy, :as => :destroy

    scope :controller => 'menu_dashboard', :path => '/:table_id/menu', :as => :menu do
      get '/index' => :index, :as => :index
      get '/new' => :new, :as => :new
      get '/:menu_id/edit' => :edit, :as => :edit
      post '/create' => :create, :as => :create
      delete '/:menu_id/destroy' => :destroy, :as => :destroy
      put '/:menu_id/update' => :update, :as => :update
      
      scope :controller => 'dish_dashboard', :path => '/:menu_id/dish/', :as => :dish do
        get '/index' => :index, :as => :index
        get '/:dish_id/edit' => :edit, :as => :edit
        put '/:dish_id/update' => :update, :as => :update
        delete '/:dish_id/destroy' => :destroy, :as => :destroy
        post '/create' => :create, :as => :create
        
      end
    end

    scope :controller => 'availability', :path => '/:table_id/availability', :as => :availability do
      post '/update' => :update, :as => :update
      post '/create' => :create, :as => :create
      post '/delete' => :delete, :as => :delete
    end

    scope :controller => 'address', :path => '/:table_id/address', :as => :address do
      post '/create' => :create, :as => :create
      post '/update' => :update, :as => :update
    end

    get '/' => :index, :as => :index
  end

  #
  # Table view
  #
  scope :controller => 'table_view', :path => '/table', :as => :table_view do
    get '/:table_id/show' => :show, :as => :show
  end

  #
  # Misc
  #
  namespace :misc do
    scope :controller => 'dish_sample', :path => '/path' do
      get 'autocomplete_dish_sample_title', :as => :autocomplete_dish_sample_title
    end
  end
 
  get 'sitemap.xml' => 'sitemaps#sitemap'  
  root :to => 'home#index'
end
