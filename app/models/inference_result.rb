class InferenceResult < ActiveRecord::Base
  belongs_to :pupil
  belongs_to :workout
end
