class AddColumnPhysicalProfileIdToPolls < ActiveRecord::Migration
  def change
    add_reference :polls, :physical_profile, index: true
    add_foreign_key :polls, :physical_profiles
  end
end
