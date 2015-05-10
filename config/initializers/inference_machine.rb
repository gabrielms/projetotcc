class InferenceMachine
	attr_accessor :first_profile, :second_profile

	AGE_WEIGHT_IN_CALCULATION = 0.1
	STATURE_WEIGHT_IN_CALCULATION = 0.1
	WEIGHT_WEIGHT_IN_CALCULATION = 0.1
	SEX_WEIGHT_IN_CALCULATION = 0.2
	OBJECTIVE_WEIGHT_IN_CALCULATION = 0.2
	DISEASES_WEIGHT_IN_CALCULATION = 0.1
	HOW_OFTEN_PRATICE_WEIGHT_IN_CALCULATION = 0.1
	HOW_LONG_IS_ON_GYM_WEIGHT_IN_CALCULATION = 0.1

	def initialize(first_profile, second_profile)	
		@first_profile = first_profile
		@second_profile = second_profile
		ensure_both_physical_profiles
	end

	def calculate_closeness
		ensure_both_physical_profiles
		closeness = 0.0
		closeness += evaluate_age_closeness
		closeness += evaluate_stature_closeness
		closeness += evaluate_weight_closeness
		closeness += evaluate_sex_closeness
		closeness += evaluate_objective_closeness
		closeness += evaluate_diseases_closeness
		closeness += evaluate_how_often_pratice_exercises
		closeness += evaluate_how_long_is_on_gym_closeness

		return closeness

	end

	private
	def both_physical_profiles
		(@first_profile.is_a? PhysicalProfile) && (@second_profile.is_a? PhysicalProfile)
	end
	
	def ensure_both_physical_profiles
		raise ArgumentError, 'Você deve enviar objetos do tipo PhysicalProfile' unless both_physical_profiles
	end

	def evaluate_age_closeness
		age_difference = (first_profile.age - second_profile.age)
		age_difference *= -1 if age_difference < 0

		evaluation = 
		case age_difference
			when 0 then 100.0
			when 0..1 then 80.0
			when 2..5 then 60.0
			when 6..10 then 40.0
			when 10..20 then 20.0
		else
			0.0
		end

		evaluation = (evaluation * AGE_WEIGHT_IN_CALCULATION)
		
		return evaluation
	end

	def evaluate_stature_closeness
		stature_difference = (first_profile.stature - second_profile.stature)

		stature_difference *= -1 if stature_difference < 0

		evaluation = 
		case stature_difference
			when 0 then 100.0
			when 0..0.05 then 80.0
			when 0.06..0.20 then 60.0
			when 0.21..0.30 then 40.0
			when 0.31..0.40 then 20.0
		else
			0.0
		end
		evaluation = (evaluation * STATURE_WEIGHT_IN_CALCULATION)
		
		return evaluation
	end

	def evaluate_weight_closeness
		weight_difference = (first_profile.weight - second_profile.weight)

		weight_difference *= -1 if weight_difference < 0

		evaluation = 
		case weight_difference
			when 0 then 100.0
			when 0..5 then 80.0
			when 5.01..10 then 60.0
			when 10.01..20 then 40.0
			when 20.01..30 then 20.0
		else
			0.0
		end
		evaluation = (evaluation * WEIGHT_WEIGHT_IN_CALCULATION)

		return evaluation
	end
	
	def evaluate_sex_closeness
		evaluation = (first_profile.sex == second_profile.sex ? 100.0 : 0.0)
		evaluation = (evaluation * SEX_WEIGHT_IN_CALCULATION)
		return evaluation
	end

	def evaluate_objective_closeness
		evaluation = (first_profile.objective == second_profile.objective ? 100.0 : 0.0)

		evaluation = (evaluation * SEX_WEIGHT_IN_CALCULATION)

		return evaluation
	end

	def evaluate_diseases_closeness
		evaluation = (first_profile.smoker == second_profile.smoker ? 25.0 : 0.0)
		evaluation += (first_profile.has_cardiac_problem == second_profile.has_cardiac_problem ? 25.0 : 0.0)
		evaluation += (first_profile.has_respiratory_problem == second_profile.has_respiratory_problem ? 25.0 : 0.0)
		evaluation += (first_profile.cardiac_diseases_in_family == second_profile.cardiac_diseases_in_family ? 25.0 : 0.0)
		evaluation = (evaluation * DISEASES_WEIGHT_IN_CALCULATION)

	end

	def evaluate_how_often_pratice_exercises
		how_often_pratice_exercises_difference = (PhysicalProfile.how_often_pratice_exercises[first_profile.how_often_pratice_exercises] - 
																							PhysicalProfile.how_often_pratice_exercises[second_profile.how_often_pratice_exercises])

		how_often_pratice_exercises_difference *= -1 if how_often_pratice_exercises_difference < 0

		evaluation = 
		case how_often_pratice_exercises_difference
			when 0 then 100.0
			when 1 then 63.0
			when 2 then 33.0
			when 3 then 0.0
		else
			0.0
		end
		evaluation = (evaluation * HOW_OFTEN_PRATICE_WEIGHT_IN_CALCULATION)

		return evaluation

	end

	def evaluate_how_long_is_on_gym_closeness
		how_long_is_on_gym_difference = (first_profile.how_long_is_on_gym - second_profile.how_long_is_on_gym)
		
		how_long_is_on_gym_difference *= -1 if how_long_is_on_gym_difference < 0

		evaluation = 
		case how_long_is_on_gym_difference
			when 0..10 then 100.0
			when 11..50 then 80.0
			when 51..100 then 60.0
			when 101..200 then 40.0
			when 201..400 then 20.0
		else
			0.0
		end

		evaluation = (evaluation * HOW_LONG_IS_ON_GYM_WEIGHT_IN_CALCULATION)
		
		return evaluation
	end

end