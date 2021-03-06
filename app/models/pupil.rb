class Pupil < ActiveRecord::Base
	belongs_to :physical_profile
	accepts_nested_attributes_for :physical_profile

	after_save :save_inference_result

	private
	def save_inference_result
			pupil_id = self.id
			InferenceResult.where(pupil_id: pupil_id).destroy_all
			Workout.all.each do |workout|
				workout_id = workout.id
				points = 0

				workout.questions.each do |question|
					first_profile = question.poll.physical_profile
					inference_machine = InferenceMachine.new(first_profile, self.physical_profile)
					closeness_to_profile = inference_machine.calculate_closeness
					question.answers.each do |answer|
						points += answer.possible_answer.nil? ? 0 : (answer.possible_answer.title.to_i * (closeness_to_profile / 100))
					end
				end
				
				inference_result = InferenceResult.new
				inference_result.workout_id = workout_id
				inference_result.pupil_id = pupil_id
				inference_result.points = points
				inference_result.save
			end
	end
end
