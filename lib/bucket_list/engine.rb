module BucketList
  class Engine < ::Rails::Engine
    isolate_namespace BucketList

    initializer 'bucket_list.ar_extensions', :before=>"action_controller.deprecated_routes" do |app|
    	ActiveRecord::Base.extend BucketList::HasLists
	end

    config.to_prepare do
    	ActionView::Base.send(:include, BucketListHelper)
    end
  end
end
