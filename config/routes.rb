TAHProject::Application.routes.draw do
  devise_for :users
  
  get "table_view/table_fiche"
  
  get 'sitemap.xml' => 'sitemaps#sitemap'
  
  root :to => 'home#index'
end
