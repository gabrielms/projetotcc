class CreateInferenceResults < ActiveRecord::Migration
  def change
    create_table :inference_results do |t|
      t.references :pupil, index: true
      t.references :workout, index: true
      t.integer :points

      t.timestamps null: false
    end
    add_foreign_key :inference_results, :pupil_id
    add_foreign_key :inference_results, :workout_id
  end
end
