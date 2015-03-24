class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.references :muscle_group, index: true

      t.timestamps null: false
    end
    add_foreign_key :workouts, :muscle_groups
  end
end
