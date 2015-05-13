module InferenceResultsHelper
	def get_workout_name(workout_id)
  	Workout.find(workout_id).name
  end
end
