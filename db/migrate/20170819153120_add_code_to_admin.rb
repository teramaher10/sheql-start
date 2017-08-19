class AddCodeToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :classroom_code, :string
  end
end
