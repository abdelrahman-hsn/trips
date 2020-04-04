class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :email
      t.string :name
      t.string :city
      t.string :phone_number
      t.boolean :available, default: true
      t.timestamps
    end
    add_index :drivers, :name
    add_index :drivers, :city
  end
end
