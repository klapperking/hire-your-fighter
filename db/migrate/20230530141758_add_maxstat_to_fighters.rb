class AddMaxstatToFighters < ActiveRecord::Migration[7.0]
  def change
    add_column :fighters, :max_stat, :integer
  end
end
