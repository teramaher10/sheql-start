class Updates < ActiveRecord::Migration[5.1]
  def change
    add_column(:activities, :title, :string, options = {})
    add_column(:activities, :date, :datetime, options = {})
    add_reference :admins, :students, index: true
    add_reference :students, :activities, index: true
  end
end
