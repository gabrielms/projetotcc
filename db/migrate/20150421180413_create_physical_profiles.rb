class CreatePhysicalProfiles < ActiveRecord::Migration
  def change
    create_table :physical_profiles do |t|
      t.integer :age
      t.float :stature
      t.float :weight
      t.integer :sex
      t.integer :objective
      t.boolean :smoker
      t.boolean :has_cardiac_problem
      t.boolean :has_respiratory_problem
      t.boolean :cardiac_diseases_in_family
      t.integer :how_often_pratice_exercises
      t.integer :how_long_is_on_gym

      t.timestamps null: false
    end
  end
end
