class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.references :user, index: true
      t.string :name
      t.string :cref
      t.string :phone

      t.timestamps null: false
    end
    add_foreign_key :coaches, :users
  end
end
