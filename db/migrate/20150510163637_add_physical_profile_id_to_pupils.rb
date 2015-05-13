class AddPhysicalProfileIdToPupils < ActiveRecord::Migration
  def change
    add_reference :pupils, :physical_profile, index: true
    add_foreign_key :pupils, :physical_profiles
  end
end
