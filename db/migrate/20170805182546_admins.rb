class Admins < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :administrator, :admins
  end

  def self.down
    rename_table :admins, :administrator
  end
end
