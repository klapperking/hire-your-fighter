class CreateFighters < ActiveRecord::Migration[7.0]
  def change
    create_table :fighters do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :rating
      t.integer :strength
      t.integer :defense
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
