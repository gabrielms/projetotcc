class PhysicalProfile < ActiveRecord::Base
	has_one :poll
	enum sex: { Masculino: 0, Feminino: 1 }
	enum objective: { Perca_de_peso: 0, Hipertrofia: 1, Forca: 2, Condicionamento: 3 }
	enum how_often_pratice_exercises: { Nunca: 0, Raramente: 1, Ocasionalmente: 2, Regularmente: 3 }
end
