class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :seat
      t.date :day
      t.references :function, null: false, foreign_key: true

      t.timestamps
    end
  end
end
