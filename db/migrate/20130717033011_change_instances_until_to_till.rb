class ChangeInstancesUntilToTill < ActiveRecord::Migration
  def change
    rename_column :instances, :until, :till
  end
end
