class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :city
      t.integer :status, default: 0
      t.integer :driver_id

      t.timestamps
    end
  end
end
