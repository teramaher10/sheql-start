class AdminCorrections < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :admin, index: true
    remove_column(:admins, :students_id, type = nil, options = {})
  end
end
