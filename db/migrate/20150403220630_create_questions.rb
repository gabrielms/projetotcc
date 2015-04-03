class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :poll, index: true
      t.string :title

      t.timestamps null: false
    end
    add_foreign_key :questions, :polls
  end
end
