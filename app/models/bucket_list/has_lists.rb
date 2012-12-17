module BucketList
	module HasLists
		def has_lists
			has_many :lists, :as => :ownable, :dependent => :destroy, :class_name => "::BucketList::List"
		end
	end
end