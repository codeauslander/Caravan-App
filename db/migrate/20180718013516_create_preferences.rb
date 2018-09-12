class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    # SL: I would love to see what the range1 and range2 columns are for.
    create_table :preferences do |t|
      t.integer :user_id
      t.boolean :enable_notifications
      t.integer :issue_type
      t.datetime :range1_start
      t.datetime :range1_end
      t.datetime :range2_start
      t.datetime :range2_end
      t.timestamps
    end
    remove_column :settings, :user_id, :integer
  end
end
