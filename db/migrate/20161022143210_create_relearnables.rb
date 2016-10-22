class CreateRelearnables < ActiveRecord::Migration
  def change
    create_table :relearnables do |t|
      t.string :reference
      t.text :summary
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
