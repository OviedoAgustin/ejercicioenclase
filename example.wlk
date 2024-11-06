class Paciente {
  var edad
  var fortalezaMuscular
  var dolor
  const rutina = []

  method edad() = edad
  method fortalezaMuscular() = fortalezaMuscular
  method dolor() = dolor
  method cumplirAnios(){edad+=1}
  method cargarRutina(unaLista){
    rutina.clear()
    rutina.addAll(unaLista)
  }

  method disminuirDolor(unValor){
    dolor = 0.max(dolor - unValor).max()
  }

  method aumentarFortalezaMuscular(valor){
    fortalezaMuscular += valor
  }

  method puedeUsar(unAparato) = unAparato.puedeSerUsadoPor(self)

  method usar(unAparato) = self.aumentarFortalezaMuscular(valor)

  method puedeHacerRutina() = rutina.all {a => self.puedeUsar(a)}

  method realizarRutina() {
    rutina.forEach {a => self.usar(a)}
  }
}

class Resistente inherits Paciente {
  override method realizarRutina(){
    const cantidad = rutina.count {a => self.puedeUsar(a)}
    super()
    self.aumentarFortalezaMuscular(rutina.count(a = >self.puedeUsar(a)))
  }
}



class RecuperacionRapida inherits Paciente {
  override method realizarRutina(){
    super()
    self.disminuirDolor(disminucionDolor.valor())
  }
}

object disminucionDolor {
  var property valor = 3
}

class Aparato {
  var property color = "blanco" 
  method consecuenciaDelUso(unPaciente)
  method puedeSerUsadoPor(unPaciente)
  method recibirMantenimiento()
  method necesitaMantenmiento() = false
}

class Caprichoso inherits Paciente {
  override method puedeHacerRutina(){
    return super() and
        self.hayAlgunAparatoRojo()
  }
  method hayAlgunAparatoRojo(){
    return rutina.any {a => a.color()=="rojo"}
  }
  override method realizarRutina(){
    super()
    super()
  }
}

class Magneto inherits Aparato{
  var magneto = 800
  override method consecuenciaDelUso(unPaciente){
    unPaciente.disminuirDolor(
      unPaciente.dolor() * 0.1
    )
    magneto -= 1
  }
  override method puedeSerUsadoPor(unPaciente){
    return true
  }
  override method recibirMantenimiento(){
    magneto = {magneto + 500}.min(800)
  }
}

class Bici inherits Aparato{
  var tornillos = 0
  var aceite = 0
  override method consecuenciaDelUso(unPaciente){
    if(unPaciente.dolor()>=30){
      tornillos += 1
      if(unPaciente.edad().between(30, 50))
        aceite += 1
    }
    unPaciente.disminuirDolor(4)
    unPaciente.aumentarFortaleza(3)
  }
  override method puedeSerUsadoPor(unPaciente){
    return unPaciente.edad() > 8
  }
  override method necesitaMantenimiento() =
   tornillos >= 10 or aceite >= 5
  override method recibirMantenimiento(){

  }
}

class Minitramp inherits Aparato{
  override method consecuenciaDelUso(unPaciente){
    unPaciente.disminuirDolor(4)
    unPaciente.aumentarFortaleza(3)
  }
  override method puedeSerUsadoPor(unPaciente){
    return unPaciente.dolor() > 20
  }

  override method recibirMantenimiento(){
    
  }
}