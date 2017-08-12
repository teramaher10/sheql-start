class FixStudent < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :student, index: true
    remove_column(:students, :activities_id, type = nil, options = {})
  end
end
