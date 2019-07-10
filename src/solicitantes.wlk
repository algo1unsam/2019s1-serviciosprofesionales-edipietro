import empresaDeServicios.*
import profesional.*

class Persona {

	var property provinciaResidencia

	method puedeSerAtendidoPor(unprofesional) {
		unprofesional.provinciasHabilitadas().contains(provinciaResidencia)
	}

}

class Institucion {

	var property universidad = []

	method agregarUniversidad(unauniversidad) {
		universidad.add(unauniversidad)
	}

	method puedeSerAtendidoPor(unprofesional) {
		return universidad.contains(unprofesional.universidad())
	}

}

