import empresaDeServicios.*
import solicitantes.*

class Profesional {

	var property universidad
	var totalRecaudado = 0

	method honorariosPorHora()

	method cobrar(unImporte) {
	}

	method provinciasHabilitadas()

	method cobrarServicios() {
		var dineroHonorarios
		dineroHonorarios += self.honorariosPorHora()
	}

	method podesTrabajarEn(unaprovincia) {
		return self.provinciasHabilitadas().contains(unaprovincia)
	}

}

class ProfesionalUniversidad inherits Profesional {

	override method honorariosPorHora() = universidad.honorarios()

	override method provinciasHabilitadas() = return universidad.provincia()

	override method cobrar(unImporte) {
		universidad.donacionRecibida(unImporte / 2)
	}

}

class ProfesionalLitoral inherits Profesional {

	override method provinciasHabilitadas() = #{ "entre rios", "santa fe", "corrientes" }

	override method honorariosPorHora() = 3000

	override method cobrar(unImporte) {
		asociacionProfesionalesLitoral.recibeDonacion(unImporte)
	}

}

class ProfesionalLibre inherits Profesional {

	var property honorariosPorHora

	override method provinciasHabilitadas() = universidad.provincia()

	override method cobrar(unImporte) {
		totalRecaudado += unImporte
	}

	method pasarA(unprofesionalLibre, unacantidad) {
		unprofesionalLibre.recibe()
		totalRecaudado -= unacantidad
	}

	method recibe(unacantidad) {
		totalRecaudado += unacantidad
	}

}

class Universidad {

	var property honorarios
	const provincia

	method donacionRecibida(undinero) {
		var dineroRecibido
		dineroRecibido += undinero
	}

}

object asociacionProfesionalesLitoral {

	var totalRecaudado

	method recibeDonacion(unImporte) {
		totalRecaudado += unImporte
	}

}

