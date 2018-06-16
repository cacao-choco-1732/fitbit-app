class CreateActivitySteps < ActiveRecord::Migration[5.2]
  def up
    create_table :activity_steps do |t|
      t.integer :fitbit_account_id, null: false
      t.date :tracking_date
      t.integer :step
      t.timestamps
    end

    add_index :activity_steps, [:fitbit_account_id, :tracking_date], unique: true
  end

  def down
    drop_table :activity_steps
  end
end
