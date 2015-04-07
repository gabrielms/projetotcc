class AddWorkoutToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :workout, index: true
    add_foreign_key :questions, :workouts
  end
end
