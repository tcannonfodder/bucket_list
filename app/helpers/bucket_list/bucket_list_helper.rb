module BucketList::BucketListHelper
	def ownable_list_form(ownable, list=nil)
		list = List.new if list.nil?
		render "bucket_list/lists/ownable_list_form", ownable: ownable, list: list
	end

	def ownable_list_list(ownable)
		render "bucket_list/lists/ownable_list_list", :ownable => ownable
	end
end