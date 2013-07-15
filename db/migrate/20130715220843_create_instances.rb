class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.integer :activity_id
      t.timestamp :when
      t.timestamp :until
      t.boolean :private

      t.timestamps
    end
    add_index :instances, :activity_id
  end
end
