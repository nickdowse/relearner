class AddRelearningTimesToRelearnable < ActiveRecord::Migration
  def change
    add_column :relearnables, :last_relearnt, :datetime
    add_column :relearnables, :number_times_relearnt, :integer
  end
end
