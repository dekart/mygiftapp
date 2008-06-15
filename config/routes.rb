ActionController::Routing::Routes.draw do |map|
  map.root :controller => "gifts", :action => "index"
  
  map.resources :gifts
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
