class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :city
      t.integer :start_trip_id
      t.integer :end_trip_id
      t.integer :status, default: 0
      t.boolean :ongoing
      t.integer :driver_id

      t.timestamps
    end
  end
end
