class ChangeInstanceNames < ActiveRecord::Migration
  def change
    rename_column :instances, :when, :time_when
    rename_column :instances, :till, :time_until
  end
end
