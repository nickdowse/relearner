class RemoveLastRelearntFromRelearnable < ActiveRecord::Migration
  def change
    remove_column :relearnables, :last_relearnt, :datetime
    remove_column :relearnables, :number_times_relearnt, :integer
  end
end
