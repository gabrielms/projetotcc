class Workout < ActiveRecord::Base
  belongs_to :muscle_group
  has_one :question
end
