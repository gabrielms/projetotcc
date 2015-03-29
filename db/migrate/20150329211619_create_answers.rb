class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :coach, index: true
      t.references :workout, index: true
      t.integer :value

      t.timestamps null: false
    end
    add_foreign_key :answers, :coaches
    add_foreign_key :answers, :workouts
  end
end
