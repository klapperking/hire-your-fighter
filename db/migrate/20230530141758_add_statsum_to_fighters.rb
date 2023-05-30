class AddStatsumToFighters < ActiveRecord::Migration[7.0]
  def change
    add_column :fighters, :stat_sum, :integer
  end
end
