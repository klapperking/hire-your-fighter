class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :expiration_date
      t.date :starting_date
      t.integer :number_of_fights
      t.string :status, default: "pending"
      t.references :user, null: false, foreign_key: true
      t.references :fighter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
