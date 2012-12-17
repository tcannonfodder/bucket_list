module BucketList
  class List < ActiveRecord::Base
    attr_accessible :name, :ownable_id, :items_attributes
    belongs_to :ownable, :polymorphic => true
    has_many :items

    accepts_nested_attributes_for :items, :reject_if => lambda{ |item| item[:name].blank? }
  end
end
