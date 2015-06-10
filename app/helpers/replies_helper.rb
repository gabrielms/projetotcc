module RepliesHelper
	def get_value_for_answer_title(title_id)
		case title_id
		when "1" then "Não deve ser feito"
		when "2" then "Levemente recomendado"
		when "3" then "Recomendado"
		when "4" then "Muito recomendado"
		when "5" then "Obrigatório"
		else
			"Não encontrado"
		end
	end
	def print_muscle_group_name(workout)
		
		muscle_group_name = ""
		MuscleGroup.all.each do |muscle_group|
			unless workout.nil?
				if(Workout.where(muscle_group_id: muscle_group.id).first.id == workout.id)
					muscle_group_name = muscle_group.name
				end
			end
		end
		return muscle_group_name
	end
end
