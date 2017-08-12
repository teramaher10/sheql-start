class TotalHours < ActiveRecord::Migration[5.1]
  def change
    add_column(:students, :total_hours, :decimal, options = {})
  end
end
