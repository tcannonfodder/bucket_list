Rails.application.routes.draw do
  resources :people do
  	#when the engine is mounted as a nested resource, it works as desired, except when it comes to generating our paths in our engine's helpers
  	mount BucketList::Engine => "/" #the goal is to access our lists like: person/:person_id/lists

  end
  #I don't want the route to be mounted at the top level, lists are owned by people
  #mount BucketList::Engine => "/bucket_list"

  #When I try to trick the route, I get the following error: ActionController::RoutingError (No route matches {}): app/views/people/show.html.erb:4:in `_app_views_people_show_html_erb___209278167088923249_70190424439760'
  #mount BucketList::Engine => "/people/:person_id/"

end
