module BucketList
	module HasLists
		def has_lists
			has_many :lists, :as => :ownable, :dependent => :destroy, :class_name => "::BucketList::List"
			include InstanceMethods
		end
	end

	module InstanceMethods
		def has_lists?
			true
		end
	end
end