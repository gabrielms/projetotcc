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
end
