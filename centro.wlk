object centro {
  const pacientes = []
  const aparatos = []

  method agregarPacientes(unPaciente){

  }

  method optimas() = aparatos.al {a => not a.necesitaMantenimiento()}

  method estoyComplicado() = self.cantNecesitanMantenimiento() >= aparatos.size().div(2)

  method cantNecesitanMantenimiento(){
    return aparatos.count {a => a.necesitaMantenimiento()}
  }

  method realizarMantenimiento(){
    self.aparatosQueNecesitanMantenimiento().forEach({a=>a.realizarMantenimiento()})
    aparatos.filter({a => a.necesitaMantenimiento()})
  }

  method aparatosQueNecesitanMantenimiento(){
    self.
  }
}