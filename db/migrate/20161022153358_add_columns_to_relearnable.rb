class AddColumnsToRelearnable < ActiveRecord::Migration
  def change
    add_column :relearnables, :easiness_factor, :integer
    add_column :relearnables, :number_repetitions, :integer
    add_column :relearnables, :quality_of_last_recall, :integer
    add_column :relearnables, :repetition_interval, :integer
    add_column :relearnables, :next_repetition, :datetime
    add_column :relearnables, :last_studied, :datetime
  end
end
