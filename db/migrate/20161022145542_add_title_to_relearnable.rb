class AddTitleToRelearnable < ActiveRecord::Migration
  def change
    add_column :relearnables, :title, :string
  end
end
