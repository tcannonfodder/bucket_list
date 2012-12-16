class CreateBucketListLists < ActiveRecord::Migration
  def change
    create_table :bucket_list_lists do |t|
      t.string :name
      t.integer :ownable_id

      t.timestamps
    end
  end
end
