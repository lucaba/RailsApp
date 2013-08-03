class CreateDataFiles < ActiveRecord::Migration
  def change
    create_table :data_files do |t|
       t.string :name,       null: false
       t.binary :data,       null: false
       t.string :extension
       t.float  :size

      t.timestamps
    end
    add_column :data_files, :user_id, :integer
    add_index :data_files, :user_id
  end
end
