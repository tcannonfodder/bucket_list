require_dependency "bucket_list/application_controller"

module BucketList
  class ListsController < ApplicationController
    def new
        #check if our list is in a nested resource (determined by a *_id param)
        @ownable = find_ownable
        # if no ownable parameter was found, then we simply create a new list
        if @ownable.nil?
            @list = List.new
        else
            #otherwise we build a new list for the ownable object
            @list = @ownable.lists.build
        end
        #regardless, we build our 3 new items
        3.times{
            @list.items.build
        }
    end
  
    def create
        #check if we are a nested resource
        @ownable = find_ownable
        #if so, we just create the list
        if @ownable.nil?
            @list = List.create(params[:list])
        else
            #otherwise we create the list within our owner
            @list = @ownable.lists.create(params[:list])
        end

        redirect_to list_path(@list)
    end
  
    def index
        #check if we are a nested resource
        @ownable = find_ownable
        #if not, then list all
        if @ownable.nil?
            @lists = List.all
        else
            #otherwise, just return the lists we need
            @lists = @ownable.lists
        end
    end
  
    def show
        #check if we are a nested resource
        @ownable = find_ownable

        #if not, then just find
        if @ownable.nil?
            @list = List.find(params[:id])
        else
            #otherwise look under the context of our ownable object
            @list = @ownable.lists.find(params[:id])
        end
    end
  
    def edit
        #check if we are a nested resource
        @ownable = find_ownable

        #if not, then just find
        if @ownable.nil?
            @list = List.find(params[:id])
        else
            #otherwise look under the context of our ownable object
            @list = @ownable.lists.find(params[:id])
        end

        3.times{
            @list.items.build
        }

    end
  
    def update
        #check if we are a nested resource
        @ownable = find_ownable

        #if not, then just find
        if @ownable.nil?
            @list = List.find(params[:id])
        else
            #otherwise look under the context of our ownable object
            @list = @ownable.lists.find(params[:id])
        end

        @list.update_attributes(params[:list])

        redirect_to list_path(@list)
    end
  
    def delete
         #check if we are a nested resource
        @ownable = find_ownable

        #if not, then just destroy
        if @ownable.nil?
            List.destroy(params[:id])
        else
            #otherwise look under the context of our ownable object and destroy
            @list = @ownable.lists.destroy(params[:id])
        end

        redirect_to :back
    end

    private

    def find_ownable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
  end
end
