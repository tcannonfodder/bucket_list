module BucketList
  class List < ActiveRecord::Base
    attr_accessible :name, :ownable_id
    belongs_to :ownable, :polymorphic => true
  end
end
