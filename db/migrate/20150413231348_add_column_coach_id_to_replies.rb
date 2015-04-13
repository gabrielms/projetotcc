class AddColumnCoachIdToReplies < ActiveRecord::Migration
  def change
    add_reference :replies, :coach, index: true
    add_foreign_key :replies, :coaches
  end
end
