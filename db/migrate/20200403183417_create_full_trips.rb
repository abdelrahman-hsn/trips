class CreateFullTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :full_trips do |t|
      t.string :city
      t.decimal :longitude, {:precision=>10, :scale=>6}
      t.decimal :latitude, {:precision=>10, :scale=>6}
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
