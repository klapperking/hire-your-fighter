class AddSpeedToFighters < ActiveRecord::Migration[7.0]
  def change
    add_column :fighters, :speed, :integer
  end
end
