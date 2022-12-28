class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :start
      t.date :end
      t.integer :number_of_people
      t.integer :hotel_id
      t.integer :user_id

      t.timestamps
    end
  end
end
