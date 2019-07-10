import profesional.*

class EmpresaServicios {

	var honorarioReferencia
	var property profesionales = []
	var property clientes=[]

	method contratarProfesional(unprofesional) {
		profesionales.add(unprofesional)
	}

	method cuantosProfesionalesEstudiaronEn(unaUniversidad) {
		return profesionales.count{ profesional => profesional.universidad() }
	}

	method profesionalesCaros() {
		return profesionales.find{ profesional => profesional.honorariosPorHora() > honorarioReferencia }
	}

	method universidadesFormadoras() {
		return profesionales.map{prof => prof.universidad()}.asSet()
	}

	method profesionalBarato() {
		return profesionales.min{ profesional => profesional.honorariosPorHora() }
	}

	method genteAcotada() {
		return profesionales.any{ profesional => profesional.provinciasHabilitadas().size() > 3 }
	}

	method puedeSatisfacer(unsolicitante) {
		profesionales.any{ prof => prof.puedeSerAtendidoPor(unsolicitante)}
	}

	method darServicio(unsolicitante) {
		if (not unsolicitante.puedeSatisfacer(unsolicitante)) {
			self.error("No puede ser atendido")
			self.elegirUnProfesionalPara(unsolicitante).cobrarServicios()
			clientes.add(unsolicitante)
		}
	}

	method elegirUnProfesionalPara(solicitante) {
		return profesionales.filter{ profesional => solicitante.puedeSerAtendidoPor(profesional).anyOne()}
	}

	method cantidadClientes() {
	}

	method tieneAClienteA(unsolicitante) {
		return profesionales.contains(unsolicitante)
	}
   
   method esPocoAtractivo(unprofesional){
   	
   	profesionales.any{prof => prof.provinciasHabilitadas() == unprofesional.provinciasHabilitadas() && prof.honorariosPorHora().min()}
   	
   }
   
   method otroQueCobraMasBarato(){
   	
   }
}

