# This migration comes from bucket_list (originally 20121216184452)
class CreateBucketListItems < ActiveRecord::Migration
  def change
    create_table :bucket_list_items do |t|
      t.string :name
      t.boolean :completed
      t.integer :list_id

      t.timestamps
    end
  end
end
