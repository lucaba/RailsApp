class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :configurations, :user_id
  end
end
