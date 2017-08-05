class CreateActivity < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :supervisor
      t.string :location
      t.string :sup_email
      t.string :description
      t.decimal :hours
    end
  end
end
