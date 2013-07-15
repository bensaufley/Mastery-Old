class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :name
      t.boolean :private
      t.string :tracking_type

      t.timestamps
    end
    add_index :activities, :user_id
  end
end
