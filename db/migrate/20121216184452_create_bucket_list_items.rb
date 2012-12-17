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
