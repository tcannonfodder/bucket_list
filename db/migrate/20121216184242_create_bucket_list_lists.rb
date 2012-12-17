class CreateBucketListLists < ActiveRecord::Migration
  def change
    create_table :bucket_list_lists do |t|
      t.string :name
      t.references :ownable, :polymorphic => true

      t.timestamps
    end
  end
end
